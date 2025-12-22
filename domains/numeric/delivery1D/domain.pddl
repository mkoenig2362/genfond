(define (domain delivery)
    (:requirements :strips :numeric-fluents :quantified-preconditions :typing)
    (:types package gripper target - locationable)
    (:predicates (holding ?p - package) (free) (is_p ?p - package) (is_g ?g - gripper) (is_t ?t - target))
    (:functions (x ?o - locationable))
    (:action up
        :parameters (?g - gripper)
        :precondition (and )
        :effect (and (increase (x ?g) 1)))
    (:action down
        :parameters (?g - gripper)
        :precondition (and )
        :effect (and (decrease (x ?g) 1)))
    (:action collect
        :parameters (?p - package ?g - gripper)
        :precondition (and (= (x ?p) (x ?g)) (free))
        :effect (and (holding ?p) (not (free))))
    (:action put
        :parameters (?p - package ?g - gripper ?t - target)
        :precondition (and (holding ?p) (= (x ?t) (x ?g)))
        :effect (and (not (holding ?p)) (free) (assign (x ?p) (x ?t))))
)