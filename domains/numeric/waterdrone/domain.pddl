(define (domain waterdrone)
  (:requirements :strips :typing :numeric-fluents :equality)
  (:types river fire - location)
  (:predicates (at ?l - location) (same ?f - fire ?e - fire))
  (:functions (burning ?f - fire) (carrying))
  (:action get-water
    :parameters (?r - river)
    :precondition (and (at ?r))
    :effect (increase (carrying) 1))
  (:action fly-to-fire
    :parameters (?f - fire ?l - location)
    :precondition (and (at ?l) (> (carrying) 0) (not (same ?f ?l)))
    :effect (and (at ?f) (not (at ?l))))
  (:action fly-to-river
    :parameters (?f - fire ?r - river)
    :precondition (and (at ?f) (= (carrying) 0))
    :effect (and (not (at ?f)) (at ?r)))
  (:action extinguish
    :parameters (?f - fire)
    :precondition (and (at ?f) (> (carrying) 0) (> (burning ?f) 0))
    :effect (and (decrease (carrying) 1) (decrease (burning ?f) 1)))
)
