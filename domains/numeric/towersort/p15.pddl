(define (problem towersort-15)
  (:domain towersort)

  (:objects
    P1 P2 P3 - piece
    T - table
  )

  (:init
    (= (size P1) 10.0)
    (= (size P2) 7.0)
    (= (size P3) 5.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)))
)
