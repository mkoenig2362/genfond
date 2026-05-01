(define (problem p04-1)
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
    (= (burning F1) 1.547)
    (= (burning F2) 2.504)
    (= (burning F3) 1.983)
    (= (burning F4) 1.134)
    (= (carrying D) 2.589)
    (at F1)
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
