(define (problem towersort-13)
  (:domain towersort)

  (:objects
    P1 P2 P3 - piece
    T - table
  )

  (:init
    (= (size P1) 9.0)
    (= (size P2) 6.0)
    (= (size P3) 2.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)
      (stacked P3)))
)
