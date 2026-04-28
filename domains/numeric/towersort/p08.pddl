(define (problem towersort-08)
  (:domain towersort)

  (:objects
    P1 P2 - piece
    T - table
  )

  (:init
    (= (size P1) 7.0)
    (= (size P2) 3.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)))
)
