(define (problem p04-3)
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
    (= (burning F1) 2.881)
    (= (burning F2) 2.612)
    (= (burning F3) 2.45)
    (= (burning F4) 4.101)
    (= (carrying D) 0.096)
    (at R)
    (atRiver)
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
