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
            o1 = float(o1.value)
        if isinstance(o2, NumericValue):
            o2 = float(o2.value)
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
            o1 = float(o1.value)
        if isinstance(o2, NumericValue):
            o2 = float(o2.value)
        if o1 in self.represent:
            return (o2 in self.represent[o1])
        if o2 in self.represent:
            return (o1 in self.represent[o2])
        for r, reps in self.represent.items():
            if o1 in reps and o2 in reps:
                return True
        return False


# ------------------------------------------------
# --------- additonal functions related to FS
# ------------------------------------------------ 


def make_iteratable(iter_this):
    return (iter_this.operands if isinstance(iter_this, And) else [iter_this])


def get_numericvalues_from_actions(domain: Domain) -> set:
    numeric_values = set()
    for action in domain.actions:
        action_facts = set()
        action_facts.update(make_iteratable(action.precondition))
        action_facts.update(make_iteratable(action.effect))
    for f in action_facts:
        if isinstance(f, BinaryFunction):
            for operand in f.operands:
                if isinstance(operand, NumericValue):
                    numeric_values.add(int(operand.value))
        else:
            pass
    # Sorted list of all numeric constants appearing in actions
    return numeric_values


def get_numericvalues_from_goal(problem: Problem) -> set:
    numeric_values = set()
    for f in make_iteratable(problem.goal):
        if isinstance(f, BinaryFunction):
            for operand in f.operands:
                if isinstance(operand, NumericValue):
                    numeric_values.add(int(operand.value))
        else:
            pass
    return numeric_values


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
