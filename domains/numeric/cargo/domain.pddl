(define (domain cargo)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types box)
  (:predicates 
    (in ?b -box)
    (clear))
  (:functions
    (size ?b - box)
    (cleared)
  )

  (:action clear-out
    :parameters ( )
    :precondition (and
      (clear)
    )
    :effect (and
      (increase (cleared) 1)
    )
  )
  (:action push
    :parameters (?b - box)
    :precondition (and
      (> (cleared) (size ?b))
    )
    :effect (and
      (not (clear))
      (in ?b)
    )
  )
)
