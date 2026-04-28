(define (problem towersort-06)
  (:domain towersort)

  (:objects
    P1 P2 - piece
    T - table
  )

  (:init
    (= (size P1) 5.0)
    (= (size P2) 4.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)))
)
