(define (problem p10-3)
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
    F9 - fire
    F10 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 1.651)
    (= (burning F2) 4.088)
    (= (burning F3) 3.914)
    (= (burning F4) 1.999)
    (= (burning F5) 3.934)
    (= (burning F6) 4.438)
    (= (burning F7) 3.156)
    (= (burning F8) 4.214)
    (= (burning F9) 2.311)
    (= (burning F10) 4.192)
    (= (carrying D) 3.952)
    (at F9)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
    (same F8 F8)
    (same F9 F9)
    (same F10 F10)
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
    (= (burning F9) 0.0)
    (= (burning F10) 0.0)
  ))
)
