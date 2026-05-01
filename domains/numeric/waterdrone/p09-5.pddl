(define (problem p09-5)
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
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 4.272)
    (= (burning F2) 2.042)
    (= (burning F3) 3.838)
    (= (burning F4) 4.004)
    (= (burning F5) 2.452)
    (= (burning F6) 3.615)
    (= (burning F7) 3.357)
    (= (burning F8) 4.517)
    (= (burning F9) 2.999)
    (= (carrying D) 1.942)
    (at F5)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
    (same F8 F8)
    (same F9 F9)
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
  ))
)
