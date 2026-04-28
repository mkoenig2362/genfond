(define (problem towersort-01)
  (:domain towersort)

  (:objects
    P1 - piece
    T - table
  )

  (:init
    (= (size P1) 9.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)))
)
