(define (problem towersort-20)
  (:domain towersort)

  (:objects
    P1 P2 P3 P4 - piece
    T - table
  )

  (:init
    (= (size P1) 6.0)
    (= (size P2) 4.0)
    (= (size P3) 2.0)
    (= (size P4) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)
      (stacked P4)))
)
