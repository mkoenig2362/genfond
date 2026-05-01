(define (problem p01-1)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.99)
    (= (carrying D) 1.331)
    (at F1)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
