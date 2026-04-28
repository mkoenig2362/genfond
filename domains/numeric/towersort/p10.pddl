(define (problem towersort-10)
  (:domain towersort)

  (:objects
    P1 P2 - piece
    T - table
  )

  (:init
    (= (size P1) 9.0)
    (= (size P2) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)
      (stacked P2)))
)
