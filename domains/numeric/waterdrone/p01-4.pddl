(define (problem p01-4)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.389)
    (= (carrying D) 0.493)
    (at R)
    (atRiver)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
