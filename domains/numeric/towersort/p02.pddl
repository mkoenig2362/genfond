(define (problem towersort-02)
  (:domain towersort)

  (:objects
    P1 - piece
    T - table
  )

  (:init
    (= (size P1) 5.0)
    (clear T)
  )

  (:goal (and
      (stacked P1)))
)
