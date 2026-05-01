(define (problem p01-5)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 1.89)
    (= (carrying D) 0.344)
    (at F1)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
