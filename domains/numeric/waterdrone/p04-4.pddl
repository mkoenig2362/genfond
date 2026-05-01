(define (problem p04-4)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.558)
    (= (burning F2) 1.035)
    (= (burning F3) 2.267)
    (= (burning F4) 2.387)
    (= (carrying D) 3.225)
    (at F4)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
  ))
)
