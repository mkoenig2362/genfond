(define (problem p01-2)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.77)
    (= (carrying D) 3.835)
    (at R)
    (atRiver)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
