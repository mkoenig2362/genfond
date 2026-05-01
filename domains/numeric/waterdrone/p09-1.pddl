(define (problem p09-1)
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
    (= (burning F1) 3.697)
    (= (burning F2) 1.396)
    (= (burning F3) 3.156)
    (= (burning F4) 3.469)
    (= (burning F5) 3.988)
    (= (burning F6) 4.673)
    (= (burning F7) 1.238)
    (= (burning F8) 3.568)
    (= (burning F9) 2.92)
    (= (carrying D) 1.366)
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
