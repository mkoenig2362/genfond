(define (problem towersort-18)
  (:domain towersort)

  (:objects
    P1 P2 P3 P4 - piece
    T - table
  )

  (:init
    (= (size P1) 10.0)
    (= (size P2) 9.0)
    (= (size P3) 5.0)
    (= (size P4) 3.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)
      (stacked P4)))
)
