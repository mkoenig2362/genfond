(define (domain snow)
  (:requirements :strips :typing :numeric-fluents)
  (:types ww dw - location)
  (:predicates (atdw))
  (:functions (snow ?l - location))
  (:action shovel
    :parameters (?w - ww)
    :precondition (> (snow ?w) 0)
    :effect (decrease (snow ?w) 1))
  (:action move-snowblower
    :parameters (?w - ww ?d - dw)
    :precondition (and (= (snow ?w) 0) (not (atdw)))
    :effect (atdw))
  (:action snow-blower
    :parameters (?w - ww ?d - dw)
    :precondition (and (atdw) (> (snow ?d) 0))
    :effect (and (decrease (snow ?d) 1) (increase (snow ?w) 1)))
)