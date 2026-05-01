(define (domain sailing)
    (:requirements :strips :typing :numeric-fluents :equality)
    (:types boat person - floats)
    (:predicates (saved ?p - person) (is_b ?b - boat) (is_p ?p - person))
    (:functions (x ?f - floats))
    (:action up
        :parameters (?b - boat)
        :precondition (and )
        :effect (and (increase (x ?b) 1)))
    (:action down
        :parameters (?b - boat)
        :precondition (and )
        :effect (and (decrease (x ?b) 1)))
    (:action save
        :parameters (?p - person ?b - boat)
        :precondition (and (= (x ?p) (x ?b)))
        :effect (and (saved ?p)))
)
