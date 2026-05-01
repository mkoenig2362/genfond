(define (problem p07-1)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    F6 - fire
    F7 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 4.993)
    (= (burning F2) 4.472)
    (= (burning F3) 1.898)
    (= (burning F4) 1.429)
    (= (burning F5) 4.276)
    (= (burning F6) 1.481)
    (= (burning F7) 3.913)
    (= (carrying D) 4.807)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
    (= (burning F6) 0.0)
    (= (burning F7) 0.0)
  ))
)
