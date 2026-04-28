(define (problem towersort-23)
  (:domain towersort)

  (:objects
    P1 P2 P3 P4 P5 - piece
    T - table
  )

  (:init
    (= (size P1) 10.0)
    (= (size P2) 9.0)
    (= (size P3) 7.0)
    (= (size P4) 6.0)
    (= (size P5) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)
      (stacked P4)
      (stacked P5)))
)
