(define (domain towersort)
  (:requirements :strips :typing :numeric-fluents)

  (:types piece table - location)

  (:predicates
    (on ?p - piece ?q - location)
    (clear ?p - location) 
    (stacked ?p - piece)
  )

  (:functions
    (size ?p - piece)
  )

  (:action put-on-table
    :parameters (?p - piece ?t - table)
    :precondition (and
      (clear ?t)
    )
    :effect (and
      (not (clear ?t))
      (clear ?p)
      (on ?p ?t)
      (stacked ?p)
    )
  )

  (:action put
    :parameters (?p - piece ?q - piece)
    :precondition (and
      (clear ?q)
      (> (size ?q) (size ?p))
    )
    :effect (and
      (not (clear ?q))
      (clear ?p)
      (on ?p ?q)
      (stacked ?p)
    )
  )
)
