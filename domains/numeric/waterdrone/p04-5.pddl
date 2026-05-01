(define (problem p04-5)
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
    (= (burning F1) 1.355)
    (= (burning F2) 1.64)
    (= (burning F3) 1.785)
    (= (burning F4) 4.953)
    (= (carrying D) 3.296)
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
