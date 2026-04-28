(define (problem towersort-30)
  (:domain towersort)

  (:objects
    P1 P2 P3 P4 P5 P6 - piece
    T - table
  )

  (:init
    (= (size P1) 8.0)
    (= (size P2) 6.0)
    (= (size P3) 5.0)
    (= (size P4) 3.0)
    (= (size P5) 2.0)
    (= (size P6) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)
      (stacked P4)
      (stacked P5)
      (stacked P6)))
)
