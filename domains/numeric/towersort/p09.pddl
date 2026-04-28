(define (problem towersort-09)
  (:domain towersort)

  (:objects
    P1 P2 - piece
    T - table
  )

  (:init
    (= (size P1) 8.0)
    (= (size P2) 2.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)))
)
