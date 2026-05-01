(define (problem p10-2)
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
    (= (burning F1) 2.482)
    (= (burning F2) 4.243)
    (= (burning F3) 4.552)
    (= (burning F4) 2.121)
    (= (burning F5) 4.604)
    (= (burning F6) 4.726)
    (= (burning F7) 2.588)
    (= (burning F8) 2.58)
    (= (burning F9) 1.991)
    (= (burning F10) 1.498)
    (= (carrying D) 3.939)
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
