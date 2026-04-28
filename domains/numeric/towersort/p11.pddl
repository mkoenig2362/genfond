(define (problem towersort-11)
  (:domain towersort)

  (:objects
    P1 P2 P3 - piece
    T - table
  )

  (:init
    (= (size P1) 4.0)
    (= (size P2) 2.0)
    (= (size P3) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)))
)
