(define (problem p05-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.392)
    (= (burning F2) 1.613)
    (= (burning F3) 4.421)
    (= (burning F4) 3.09)
    (= (burning F5) 2.133)
    (= (carrying D) 3.249)
    (at F3)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
  ))
)
