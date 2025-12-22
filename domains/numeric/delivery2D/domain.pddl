(define (domain delivery)
    (:requirements :strips :numeric-fluents :quantified-preconditions :typing)
    (:types package gripper target - locationable)
    (:predicates (holding ?p - package) (free) (is_p ?p - package) (is_g ?g - gripper) (is_t ?t - target))
    (:functions (x ?o - locationable) (y ?o - locationable))
    (:action up
        :parameters (?g - gripper)
        :precondition (and )
        :effect (and (increase (y ?g) 1)))
    (:action down
        :parameters (?g - gripper)
        :precondition (and )
        :effect (and (decrease (y ?g) 1)))
    (:action right
        :parameters (?g - gripper)
        :precondition (and )
        :effect (increase (x ?g) 1))
    (:action left
        :parameters (?g - gripper)
        :precondition (and )
        :effect (decrease (x ?g) 1))
    (:action collect
        :parameters (?p - package ?g - gripper)
        :precondition (and (= (x ?p) (x ?g)) (= (y ?p) (y ?g)) (free))
        :effect (and (holding ?p) (not (free))))
    (:action put
        :parameters (?p - package ?g - gripper ?t - target) ; find the pkg at the target and put it down there
        :precondition (and (holding ?p) (= (x ?t) (x ?g)) (= (y ?t) (y ?g)))
        :effect (and (not (holding ?p)) (free) (assign (x ?p) (x ?t)) (assign (y ?p) (y ?t))))
)