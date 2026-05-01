(define (problem p08-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    F6 - fire
    F7 - fire
    F8 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 1.635)
    (= (burning F2) 1.981)
    (= (burning F3) 2.413)
    (= (burning F4) 4.114)
    (= (burning F5) 4.302)
    (= (burning F6) 1.99)
    (= (burning F7) 4.65)
    (= (burning F8) 3.001)
    (= (carrying D) 3.664)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
    (same F8 F8)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
    (= (burning F6) 0.0)
    (= (burning F7) 0.0)
    (= (burning F8) 0.0)
  ))
)
