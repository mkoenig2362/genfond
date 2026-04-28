(define (problem towersort-03)
  (:domain towersort)

  (:objects
    P1 - piece
    T - table
  )

  (:init
    (= (size P1) 10.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)))
)
