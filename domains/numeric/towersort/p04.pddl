(define (problem towersort-04)
  (:domain towersort)

  (:objects
    P1 - piece
    T - table
  )

  (:init
    (= (size P1) 1.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)))
)
