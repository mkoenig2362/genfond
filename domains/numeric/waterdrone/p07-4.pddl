(define (problem p07-4)
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
    (= (burning F1) 3.976)
    (= (burning F2) 4.772)
    (= (burning F3) 1.972)
    (= (burning F4) 1.623)
    (= (burning F5) 1.035)
    (= (burning F6) 2.159)
    (= (burning F7) 4.827)
    (= (carrying D) 2.647)
    (at F6)
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
