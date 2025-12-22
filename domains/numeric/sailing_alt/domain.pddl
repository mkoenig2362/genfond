(define (domain sailing)
    (:requirements :strips :typing :numeric-fluents :quantified-preconditions)
    (:types boat person - floats)
    (:predicates (saved ?p - person) (is_b ?b - boat) (is_p ?p - person))
    (:functions (x ?b - floats) (y ?b - floats))
    (:action downwind
        :parameters (?b - boat)
        :precondition (and )
        :effect (and (increase (y ?b) 1)))
    (:action left
        :parameters (?b - boat)
        :precondition (and )
        :effect (and (decrease (x ?b) 1)))
    (:action right
        :parameters (?b - boat)
        :precondition (and )
        :effect (and (increase (x ?b) 1)))
    (:action save
        :parameters (?p - person ?b - boat)
        :precondition (and (= (x ?p) (x ?b)) (= (y ?p) (y ?b)))
        :effect (and (saved ?p)))
)