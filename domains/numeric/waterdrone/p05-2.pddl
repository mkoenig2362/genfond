(define (problem p05-2)
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
    (= (burning F1) 1.211)
    (= (burning F2) 3.316)
    (= (burning F3) 3.83)
    (= (burning F4) 2.232)
    (= (burning F5) 3.356)
    (= (carrying D) 0.744)
    (at R)
    (atRiver)
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
