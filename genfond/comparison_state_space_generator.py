import logging
import random
from collections.abc import Collection
from enum import Enum
from typing import Any, Optional
import copy
import numbers

from pddl.action import Action
from pddl.core import Domain, Problem
from pddl.logic import Predicate
from pddl.logic.base import And, Formula, Not, OneOf
from pddl.logic.effects import When
from pddl.logic.functions import (
    Assign,
    BinaryFunction,
    Decrease,
    Divide,
)
from pddl.logic.functions import EqualTo as FunctionEqualTo
from pddl.logic.functions import (
    FunctionExpression,
    GreaterEqualThan,
    GreaterThan,
    Increase,
    LesserEqualThan,
    LesserThan,
    Minus,
    NumericFunction,
    NumericValue,
    Plus,
    ScaleDown,
    ScaleUp,
    Times,
)
from pddl.logic.predicates import EqualTo

from genfond.ground import ground, ground_domain_predicates, ground_domain_functions
from genfond.state_space_generator import State, StateSpaceNode, Alive, StateSpaceGraph
from collections import defaultdict
from typing import Iterable, Dict, Set, Tuple, Optional


log = logging.getLogger("genfond.backwards_state_space_generator")

#-------- class handeling ordering and equality for one set of functions --------
class FunctionSet:
    def __init__(self, related: set):
        self.funcs = related
        self.values = [] # TODO remove because irrelevant? 

        self.ordering = [] # 0 < b < 1 < a < 10
        self.represent = dict() # b = {c}, 1 = {e, f}
    
    def __str__(self):
        def _pretty(obj):
            txt = str(obj)
            if "(" in txt:
                head, tail = txt.split("(", 1)
                return head.lower() + "(" + tail
            return txt.lower()
        parts = []
        for o in self.ordering: # get all < with all equalities involved
            if o in self.represent:
                parts.append(" = ".join(_pretty(s) for s in ([o] + list(self.represent[o]))))
            else:
                parts.append(_pretty(o))
        line = " < ".join(parts)
        for r in self.represent:
            if r not in self.ordering:
                line += ", " + " = ".join(_pretty(s) for s in ([r] + list(self.represent[r])))
        return line

    def _has(self, function):
        return (function in self.funcs)

    def _considers(self, value):
        return (value in self.values)

    def equals(self, other):
        if str(self) == str(other):
            return True
        if len(other.ordering) != len(self.ordering):
            return False
        for i, o in enumerate(other.ordering):
            s = self.ordering[i]
            if o in other.represent.keys():
                if s not in self.represent.keys():
                    return False
                if ({o}|other.represent[o]) != ({s}|self.represent[s]):
                    return False
            else:
                if s != o:
                    return False
        for r in other.represent: 
            found_equal = False
            for s in self.represent:
                if ({r}|other.represent[r]) == ({s}|self.represent[s]):
                    found_equal = True
            if not found_equal:
                return False
        return True
    
    def _less_than(self, o1, o2) -> bool: # o1 < o2, 0=no,1=yes,2=possible
        if isinstance(o1, NumericValue):
            o1 = int(o1.value)
        if isinstance(o2, NumericValue):
            o2 = int(o2.value)
        found_o1 = False
        for o in self.ordering:
            if not found_o1:
                if o1 == o or (o in self.represent and o1 in self.represent[o]):
                    found_o1 = True
            else:
                if o2 == o or (o in self.represent and o2 in self.represent[o]):
                    return True
        return False

    def _equal(self, o1, o2) -> bool:
        if isinstance(o1, NumericValue):
            o1 = int(o1.value)
        if isinstance(o2, NumericValue):
            o2 = int(o2.value)
        if o1 in self.represent:
            return (o2 in self.represent[o1])
        if o2 in self.represent:
            return (o1 in self.represent[o2])
        for r, reps in self.represent.items():
            if o1 in reps and o2 in reps:
                return True
        return False

#-------- class representing one Comparison Node --------
class ComparisonNode:
    def __init__(self, id, predicates):
        self.id: int = id
        self.predicates: set = predicates
        self.children: dict[Action, set[ComparisonNode]] = dict()
        self.parents: set[ComparisonNode] = set()
        self.goal = False
        self.initial = False
        self.alive = Alive.UNKNOWN
        self.visited = False                        # TODO remove?
        self.function_sets: list[FunctionSet] = []
        
    def __str__(self) -> str:
        def _pretty(obj):
            txt = str(obj)
            if "(" in txt:
                head, tail = txt.split("(", 1)
                return head.lower() + "(" + tail
            return txt.lower()
        pred_line = ", ".join(_pretty(p) for p in sorted(self.predicates, key=str))
        ordering_part = r"\l".join(map(str, self.function_sets))
        unk_part = ""
        label_chunks = []
        if pred_line:
            label_chunks.append(pred_line)
        if ordering_part:
            label_chunks.append(ordering_part)
        label_text = r"\l".join(label_chunks) + r"\l"
        label_text = label_text.replace('"', r'\"')
        color = 'lightblue' if self.goal else ('lightgreen' if self.initial else None)
        style = f'style=filled, fillcolor={color}, ' if color else ''
        return (f'    {self.id} [shape=box, {style}label="{label_text}", '
                f'xlabel="{self.id}"];')
    def __repr__(self) -> str:
        return self.__str__()

    def add_child(self, action: Action, node: "ComparisonNode") -> None:
        self.children.setdefault(action, set()).add(node)

    def equals(self, other: "ComparisonNode") -> bool:
        if other.predicates != self.predicates:
            return False
        for i, sfs in enumerate(self.function_sets):
            if not sfs.equals(other.function_sets[i]):
                return False
        return True

    def clone_node(self) -> "ComparisonNode":
        new_node = ComparisonNode(-1, self.predicates.copy())
        new_node.function_sets = copy.deepcopy(self.function_sets)
        return new_node

    def get_func_set(self, f):
        for fs in self.function_sets:
            if f in fs.funcs:
                return fs

    def check(self, conditions: Formula): # -> set(ComparisonNode):
        nodes = []
        nodes.append(self)
        facts = make_iteratable(conditions)
        for f in facts:
            if isinstance(f, Predicate):
                if f not in self.predicates:
                    return False
            elif isinstance(f, Not):
                if f.argument in self.predicates:
                    return False
            elif isinstance(f, BinaryFunction):
                left, right = f.operands
                func_set = self.get_func_set(left)
                if isinstance(f, FunctionEqualTo):
                    if not func_set._equal(left, right):
                        return False
                elif isinstance(f, LesserThan):
                    if not func_set._less_than(left, right):
                        return False
                elif isinstance(f, GreaterThan):
                    if not func_set._less_than(right, left):
                        return False
        return True


#-------- Graph made out of Comparison Nodes --------
class ComparisonStateGraph:
    def __init__(
        self,
        domain: Domain,
        problem: Problem,
        prune: bool = True,
        #selected_states: Optional[set[ComparisonState]] = None, TODO what are these for?
        #max_num_val: Optional[int] = None,
    ):
        self.domain = domain
        self.problem = problem
        self.next_id = 0
        queue = []
        self.nodes: dict[int, ComparisonNode] = dict()
        # define root as the init and build the Function sets
        self.root = self.set_init_node() # = self.root
        self.root.id = self.next_id
        self.next_id = 1
        self.nodes = {self.root.id: self.root}
        #print("root!", self.root)
        queue = [self.root]
        grounded_actions = ground(domain, problem)
        while queue:
            node = queue.pop(0)
            if node.check(self.problem.goal):
                node.goal = True
                node.alive = Alive.ALIVE
            for action in grounded_actions:
                if not node.check(action.precondition): # returns self  if true or set of possibilities
                    continue
                #print(action.name)
                for succ in apply_effects(node, action.effect):
                    if False: # and non_valid_values(succ, 0): # TODO introduce no_neg_values as a parameter
                        continue
                    new_node = self.add_node(succ, node, action)
                    if new_node:
                        #print(new_node)
                        queue.append(new_node)
        #self.graphviz_print()
        compute_alive(self.nodes.values())
        if prune:
            self.prune_nodes()
        assert all(node.alive != Alive.UNKNOWN for node in self.nodes.values())

    def set_init_node(self) -> ComparisonNode:
        predicates = set()
        function_sets = [{func} for func in ground_domain_functions(self.domain, self.problem)]
        equalities = dict()
        facts = set()
        # initial
        for g in self.problem.init:
            if isinstance(g, Predicate):
                predicates.add(g)
            elif isinstance(g, FunctionExpression):
                equalities[g.operands[0]] = g.operands[1].value
                # facts.add(g) dont add, so we can remove value later if irrelevant
        # actions
        for grounded_action in ground(self.domain, self.problem):
            facts.update(make_iteratable(grounded_action.precondition))
            facts.update(make_iteratable(grounded_action.effect))
        # goal
        facts.update(make_iteratable(self.problem.goal))
        # now build the node
        initial_node = ComparisonNode(-1, predicates)
        initial_node.initial = True
        for f in facts:
            if isinstance(f, BinaryFunction) and not isinstance(f, Increase) and not isinstance(f, Decrease):
                if isinstance(f.operands[0], NumericFunction) and isinstance(f.operands[1], NumericFunction): 
                    for i, s in enumerate(function_sets):
                        if f.operands[0] in s:
                            index_set1 = i
                        if f.operands[1] in s:
                            index_set2 = i
                    if index_set1 == index_set2:
                        continue
                    function_sets[index_set1].update(function_sets[index_set2])
                    del function_sets[index_set2]
                else: # one of them is a value
                    if isinstance(f.operands[0], NumericFunction) and isinstance(f.operands[1], NumericValue):
                        func = f.operands[0]
                        value = int(f.operands[1].value)
                    elif isinstance(f.operands[0], NumericValue) and isinstance(f.operands[1], NumericFunction):
                        func = f.operands[1]
                        value = int(f.operands[0].value)
                    for i, s in enumerate(function_sets):
                        if func in s:
                            index_set = i
                    function_sets[index_set].add(value)
        for related in function_sets:
            #get all numbers sorted out:
            nums_important_sorted = sorted(int(item) for item in related if isinstance(item, numbers.Number))
            nums_remove_later = [
                (fct, int(equalities[fct]))              # keep both pieces of info
                for fct in related
                if fct in equalities
                and int(equalities[fct]) not in nums_important_sorted
            ]
            nums_sorted = sorted(
                nums_important_sorted +
                [num for _, num in nums_remove_later]
            )
            related.difference_update(nums_sorted)
            # now build the FunctionSet
            new_set = FunctionSet(related)
            new_set.ordering = nums_sorted
            new_set.values = nums_sorted
            for r in related:
                if r in equalities.keys():
                    r_value = int(equalities[r])
                else:
                    r_value = 0
                if r_value not in new_set.represent:
                    new_set.represent[r_value] = {r}
                else:
                    new_set.represent[r_value].add(r)
                if r_value not in new_set.ordering:
                    inserted = False
                    for v in new_set.ordering.copy():
                        if v > r_value:
                            new_set.ordering.insert(new_set.ordering.index(v), r_value)
                            inserted = True
                    if not inserted:
                        new_set.ordering.append(r_value) 
            # remove all useless numbers
            static_preds, static_fcts = classify_static_fluents(self.domain, self.problem)
            for fct, num in nums_remove_later:
                if fct not in static_fcts:
                    if num in new_set.represent:
                        next_rep = new_set.represent[num].pop()
                        if len(new_set.represent[num]) > 0:
                            new_set.represent[next_rep] = new_set.represent[num]
                        index_left = new_set.ordering.index(num)
                        new_set.ordering[index_left] = next_rep
                        new_set.represent.__delitem__(num)
                    else:
                        new_set.ordering.remove(num)
            initial_node.function_sets.append(new_set)
        # remove all 
        return initial_node

    def add_node(self, node: ComparisonNode, parent: ComparisonNode, action) -> Optional[ComparisonNode]:
        new = True
        for id, n in self.nodes.items():
            if n.equals(node):
                new = False
                node = n
        if new:
            node.id = self.next_id
            self.next_id += 1
            self.nodes[node.id] = node
        node.parents.add(parent)
        parent.add_child(action, node)
        if new:
            return node
        else:
            return None

    def prune_nodes(self) -> None:
        pruned_dead = []
        pruned_selected: list[State] = []
        for id, node in self.nodes.items():
            if node.alive == Alive.DEAD and all([parent.alive == Alive.DEAD for parent in node.parents]):
                pruned_dead.append(id)
        before = len(self.nodes)
        for id in pruned_dead + pruned_selected:
            del self.nodes[id]
        for node in self.nodes.values():
            for action, children in node.children.items():
                node.children[action] = {child for child in children if child.id in self.nodes}
        log.info(f"Pruned {len(pruned_dead)} dead " f"out of {before} in {self.problem.name}")

    def graphviz_print(self):
        for id, node in self.nodes.items():
            print(node)
            for action in node.children:
                for child in node.children[action]:
                    print(f'    {id} -> {child.id} [label="{action.name}({action.parameters})"];')

    def get_comparison_child_state(self, node, child_id, child_state, action):
        equalities, pred = dict(), set()
        for fact in child_state:
            if isinstance(fact, FunctionEqualTo):
                equalities[fact.operands[0]] = fact.operands[1].value
            else:
                pred.add(fact)
        comparison_children = self.nodes[node.id].children[action]
        comparison_child_node = next((child for child in comparison_children if child.id == child_id), None)
        # we don't check predicates, they are correct. Also assignments should be correct!
        for eff in make_iteratable(action.effect):
            if isinstance(eff, (Increase, Decrease)):
                c = eff.operands[0]
                c_value = equalities[c]
                f_set = comparison_child_node.get_func_set(c)
                index, r = None, None
                if c in f_set.ordering:
                    index = f_set.ordering.index(c)
                else:
                    for r, rep in f_set.represent.items():
                        if c in rep:
                            index = f_set.ordering.index(r)
                            if isinstance(r, NumericFunction):
                                r_value = equalities[r]
                            else:
                                r_value = r
                if index != None: # check left < c < right
                    left, right = None, None
                    if index != 0:
                        left = f_set.ordering[index-1]
                        if isinstance(left, NumericFunction):
                            left = equalities[left]
                    if index != len(f_set.ordering)-1:
                        right = f_set.ordering[index+1]
                        if isinstance(right, NumericFunction):
                            right = equalities[right]
                    if (left != None and right != None) and not(left < c_value and c_value < right):
                        c_value = left + ((right - left)/2)
                    elif (left != None) and not(left < c_value):
                        c_value = left + 0.5 # TODO replace by non static value
                    elif (right != None) and not(c_value < right):
                        c_value = right - 0.5
                if r != None: #and c_value != r_value:
                    c_value == r_value
                equalities[c] = c_value
        #overwrite the state to match comparison node conditions
        corrected_child_state = frozenset(pred | {FunctionEqualTo(f, NumericValue(v)) for f,v in equalities.items()})
        return corrected_child_state


def apply_effects(node: ComparisonNode, effects: Formula) -> set[ComparisonNode]:
    new_potential_nodes: set[ComparisonNode] = set()
    new_node = node.clone_node()
    inc_or_dec = set()
    facts = make_iteratable(effects)
    for f in facts:
        if isinstance(f, Predicate):
            new_node.predicates.add(f)
        elif isinstance(f, Not):
            new_node.predicates.discard(f.argument)
        elif isinstance(f, BinaryFunction):
            left, right = f.operands
            func_set = new_node.get_func_set(left)
            if isinstance(f, Assign):
                # erease left
                if left not in func_set.ordering:
                    for r, reps in func_set.represent.items():
                        if left in reps:
                            reps.discard(left)
                            break
                else:
                    if left in func_set.represent:
                        next_rep = func_set.represent[left].pop()
                        if len(func_set.represent[left]) > 0:
                            func_set.represent[next_rep] = func_set.represent[left]
                        func_set.represent.__delitem__(left)
                        index_left = func_set.ordering.index(left)
                        func_set.ordering[index_left] = next_rep
                    else:
                        func_set.ordering.remove(left)
                # set right = left
                if isinstance(right, NumericValue):
                    right = right.value
                if right in func_set.represent:
                    func_set.represent[right].add(left)
                elif right in func_set.ordering:
                    func_set.represent[right] = {left}
                elif isinstance(right, numbers.Number): # special case of a new value
                    func_set.represent[right] = {left}
                    inserted = False
                    for v in func_set.ordering:
                        if v > right:
                            func_set.ordering.insert(func_set.ordering.index(v), right)
                            inserted = True
                    if not inserted:
                        func_set.ordering.append(right) 
                else: # ? = {right, ...}
                    for r, reps in func_set.represent.items():
                        if right in reps:
                            reps.add(left)
            elif isinstance(f, Increase) or isinstance(f, Decrease):
                inc_or_dec.add(f)
    new_potential_nodes.add(new_node)
    # handle all cases
    for c in inc_or_dec:
        for n in new_potential_nodes.copy():
            co = c.operands[0]
            f_set_n = n.get_func_set(co)
            has_equals, is_equal = False, None
            if co not in f_set_n.ordering:
                for r, reps in f_set_n.represent.items():
                    if co in reps:
                        is_equal = r
                        break
            else:
                if co in f_set_n.represent:
                    has_equals = True
            new_potential_nodes.remove(n)
            nodes = []
            if isinstance(c, Increase):
                if not (has_equals or is_equal != None):
                    nodes.append(n) # no visible change
                    new_node_gr = n.clone_node() # inc up to next change
                    f_set = new_node_gr.get_func_set(co)
                    if f_set.ordering.index(co) < len(f_set.ordering) - 1:
                        next_ord = f_set.ordering[f_set.ordering.index(co) + 1]
                        if next_ord in f_set.represent:
                            f_set.represent[next_ord].add(co)
                        else:
                            f_set.represent[next_ord] = {co}
                        f_set.ordering.remove(co)
                        nodes.append(new_node_gr)
                else:
                    new_node_eq = n.clone_node()
                    f_set = new_node_eq.get_func_set(co)
                    if is_equal != None:
                        f_set.represent[is_equal].discard(co)
                        if len(f_set.represent[is_equal]) == 0:
                            f_set.represent.__delitem__(is_equal)
                        new_index = f_set.ordering.index(is_equal) + 1
                        f_set.ordering.insert(new_index, co)
                    else: # has_equals
                        next_rep = f_set.represent[co].pop()
                        if len(f_set.represent[co]) > 0:
                            f_set.represent[next_rep] = f_set.represent[co]
                        f_set.represent.pop(co)
                        index_co = f_set.ordering.index(co)
                        f_set.ordering[index_co] = next_rep
                        f_set.ordering.insert(index_co + 1, co)
                    nodes.append(new_node_eq)
            elif isinstance(c, Decrease):
                if not (has_equals or is_equal != None):
                    nodes.append(n) # no visible change
                    new_node_lr = n.clone_node() # dec down to next change
                    f_set = new_node_lr.get_func_set(co)
                    if f_set.ordering.index(co) != 0:
                        next_ord = f_set.ordering[f_set.ordering.index(co) - 1]
                        if next_ord in f_set.represent:
                            f_set.represent[next_ord].add(co)
                        else:
                            f_set.represent[next_ord] = {co}
                        f_set.ordering.remove(co)
                        nodes.append(new_node_lr)
                else:
                    new_node_eq = n.clone_node()
                    f_set = new_node_eq.get_func_set(co)
                    if is_equal != None:
                        f_set.represent[is_equal].discard(co)
                        if len(f_set.represent[is_equal]) == 0:
                            f_set.represent.__delitem__(is_equal)
                        f_set.ordering.insert(f_set.ordering.index(is_equal), co)
                    else: # has_equals
                        next_rep = f_set.represent[co].pop()
                        if len(f_set.represent[co]) > 0:
                            f_set.represent[next_rep] = f_set.represent[co]
                        f_set.represent.pop(co)
                        index_co = f_set.ordering.index(co)
                        f_set.ordering[index_co] = next_rep
                        f_set.ordering.insert(index_co, co)
                    nodes.append(new_node_eq)
            new_potential_nodes.update(nodes)
    return new_potential_nodes

def make_iteratable(iter_this):
    return (iter_this.operands if isinstance(iter_this, And) else [iter_this])

def generate_state_space_from_comparison_graph(comp_graph: ComparisonStateGraph, selected_states: Optional[set[State]] = None):
    state_graph = StateSpaceGraph(comp_graph.domain, comp_graph.problem, selected_states=selected_states, generate_nodes=False, prune = False)
    state_graph.nodes = {}
    for cid, cnode in comp_graph.nodes.items():
        pred = cnode.predicates
        value_of: dict[NumericFunction, float] = {}
        for s in cnode.function_sets:
            anchors = {i:float(o) for i,o in enumerate(s.ordering) if isinstance(o, numbers.Number)} # [-1<0<2<3<10] OR []
            last_anch_val, last_anch_pos, step = None, -1, 1.0
            N, i = len(s.ordering), 0
            while i < N:
                if i in anchors:
                    val = anchors[i]
                    gap_len = i - last_anch_pos -1
                    if 0 < gap_len:
                        step_size = ((val - last_anch_val) / (gap_len + 1)) if last_anch_val is not None else step
                        cur = last_anch_val + step_size if last_anch_val is not None else val - step_size * gap_len
                        for j in range(last_anch_pos +1, i):
                            value_of[s.ordering[j]] = cur
                            cur += step_size
                    last_anch_pos = i
                    last_anch_val = val
                i += 1
            cur = last_anch_val if last_anch_val is not None else 0.0
            for j in range(last_anch_pos + 1, N):
                cur += step
                value_of[s.ordering[j]] = cur
            for r, reps in s.represent.items():
                for p in reps:
                    if isinstance(r, NumericFunction):
                        value_of[p] = value_of[r]
                    else:
                        value_of[p] = r
        state = frozenset(pred | {FunctionEqualTo(f, NumericValue(v)) for f,v in value_of.items()})
        node = StateSpaceNode(state, cnode.id)
        node.alive = cnode.alive
        node.goal = cnode.goal
        state_graph.nodes[cid] = node
    def get_state_node(snodes, sid):
        for state, node in snodes.items():
            if node.id == sid:
                return node
    for cid, cnode in comp_graph.nodes.items():
        snode = get_state_node(state_graph.nodes, cid)
        for action, childs in cnode.children.items():
            for child in childs:
                snode.add_child(action, get_state_node(state_graph.nodes, child.id))
        for parent in cnode.parents:
            snode.parents.add(get_state_node(state_graph.nodes, parent.id))
        snode.alive = Alive.ALIVE
    return state_graph

# ------------------------------------------------
# --------- functions to find dead and alive nodes
# ------------------------------------------------ 

def can_reach(node: ComparisonNode, goal_nodes: Collection[ComparisonNode]) -> bool:
    seen = set()
    stack = [node]
    while stack:
        current_node = stack.pop()
        if current_node in goal_nodes:
            return True
        if current_node.alive == Alive.DEAD:
            continue
        if current_node.alive == Alive.ALIVE:
            return True
        if current_node in seen:
            continue
        seen.add(current_node)
        for children in current_node.children.values():
            if all(child.alive != Alive.DEAD for child in children):
                stack.extend(children)
    return False


def find_nodes_leading_to_dead(nodes: Collection[ComparisonNode]) -> bool:
    queue = [node for node in nodes if node.alive == Alive.UNKNOWN]
    changed = False
    while queue:
        node = queue.pop()
        if all(any(child.alive == Alive.DEAD for child in children) for children in node.children.values()):
            node.alive = Alive.DEAD
            changed = True
            for parent in node.parents:
                if parent.alive == Alive.UNKNOWN:
                    queue.append(parent)
    return changed


def find_node_not_reaching_goal(nodes: Collection[ComparisonNode]) -> bool:
    queue = [node for node in nodes if node.alive == Alive.UNKNOWN]
    goal_nodes = [node for node in nodes if node.alive in [Alive.ALIVE, Alive.PRUNED]]
    changed = False
    while queue:
        node = queue.pop()
        if not can_reach(node, goal_nodes):
            node.alive = Alive.DEAD
            changed = True
            for parent in node.parents:
                if parent.alive == Alive.UNKNOWN:
                    queue.append(parent)
    return changed


def compute_alive(nodes: Collection[ComparisonNode]) -> None:
    changed = True
    while changed:
        changed = find_nodes_leading_to_dead(nodes)
        changed = find_node_not_reaching_goal(nodes) or changed
    for node in nodes:
        if node.alive == Alive.UNKNOWN:
            node.alive = Alive.ALIVE



def _collect_dynamic_symbols(domain: Domain, problem: Problem):
    """
    Return two *sets*:
        dyn_predicates … every predicate symbol that is added/deleted
        dyn_functions  … every function symbol that is assigned/increased/…
    """
    dyn_predicates = set()
    dyn_functions = set()
    for action in ground(domain, problem):
        if isinstance(action.effect, And):
            effects = action.effect.operands
        else:
            effects = [action.effect]
        for eff in effects:
            if isinstance(eff, Predicate):
                dyn_predicates.add(eff)
            elif isinstance(eff, Not):
                dyn_predicates.add(eff.argument)
            elif isinstance(eff, (Increase, Decrease, Assign, Plus, Minus)):
                for o in eff.operands:
                    if isinstance(o, NumericFunction):
                        dyn_functions.add(o)
            elif isinstance(eff, Assign):
                dyn_functions.add(eff.operands[0])
    return dyn_predicates, dyn_functions

def classify_static_fluents(domain: Domain, problem: Problem):
    """
    Return a dict  ground_fluent -> is_static  (bool)    Return a dict  ground_fluent -> is_static  (bool)
    where ground_fluent is either an Atom (predicate) or a NumericFunction.
    """
    ground_preds = ground_domain_predicates(domain, problem)
    ground_funcs = ground_domain_functions(domain, problem)
    dyn_preds_sym, dyn_funcs_sym = _collect_dynamic_symbols(domain, problem)
    result_preds, result_funcs = [], []
    for p in ground_preds:
        if p not in dyn_preds_sym:
            result_preds.append(p)
    for f in ground_funcs:
        if f not in dyn_funcs_sym:
            result_funcs.append(f)
    return result_preds, result_funcs





def non_valid_values(node: ComparisonNode, value: int) -> bool:
    for k, gr in node.functions["<"].items():
        if not isinstance(k, NumericValue):
            for g in gr:
                if isinstance(g, NumericValue) and g.value == value:
                    return True
    return False
