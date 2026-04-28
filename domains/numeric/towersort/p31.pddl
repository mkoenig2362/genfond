(define (problem towersort-31)
  (:domain towersort)

  (:objects
    P1 P2 P3 P4 P5 P6 P7 - piece
    T - table
  )

  (:init
    (= (size P1) 7.0)
    (= (size P2) 6.0)
    (= (size P3) 5.0)
    (= (size P4) 4.0)
    (= (size P5) 3.0)
    (= (size P6) 2.0)
    (= (size P7) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)
      (stacked P4)
      (stacked P5)
      (stacked P6)
      (stacked P7)))
)
