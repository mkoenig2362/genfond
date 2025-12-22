(define (domain got_to)
  (:requirements :strips :typing :numeric-fluents :equality)
  (:types robot target - locate)
  (:predicates (is_robot ?r - robot) (is_target ?r - target))
  (:functions (x ?r - locate))

  (:action right
    :parameters (?r - robot)
    :precondition (and )
    :effect (increase (x ?r) 1)
    )
  (:action left
    :parameters (?r - robot)
    :precondition (and )
    :effect (decrease (x ?r) 1)
    )
)