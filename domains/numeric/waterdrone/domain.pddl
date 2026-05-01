(define (domain waterdrone)
  (:requirements :strips :typing :numeric-fluents :equality)
  (:types river fire - location drone)
  (:predicates (atRiver) (at ?f - location) (same ?f - fire ?e - fire))
  (:functions (burning ?f - fire) (carrying ?d - drone))
  (:action get-water
    :parameters (?r - river ?d - drone)
    :precondition (and (at ?r))
    :effect (increase (carrying ?d) 1))
  (:action fly-to-fire
    :parameters (?f - fire ?l - location)
    :precondition (and (at ?l) (not (same ?f ?l)))
    :effect (and (at ?f) (not (at ?l)) (not (atRiver))))
  (:action fly-to-river
    :parameters (?f - fire ?r - river)
    :precondition (and (at ?f))
    :effect (and (not (at ?f)) (at ?r) (atRiver)))
  (:action extinguish
    :parameters (?f - fire ?d - drone)
    :precondition (and (at ?f) (> (carrying ?d) 0) (> (burning ?f) 0))
    :effect (and (decrease (carrying ?d) 1) (decrease (burning ?f) 1)))
)