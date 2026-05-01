(define (problem p10-4)
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
    (= (burning F1) 4.189)
    (= (burning F2) 4.309)
    (= (burning F3) 3.847)
    (= (burning F4) 3.438)
    (= (burning F5) 3.912)
    (= (burning F6) 4.879)
    (= (burning F7) 3.867)
    (= (burning F8) 1.219)
    (= (burning F9) 3.491)
    (= (burning F10) 2.944)
    (= (carrying D) 3.784)
    (at F1)
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
