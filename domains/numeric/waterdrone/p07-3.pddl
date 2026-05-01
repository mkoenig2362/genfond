(define (problem p07-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    F6 - fire
    F7 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.252)
    (= (burning F2) 4.119)
    (= (burning F3) 3.102)
    (= (burning F4) 2.845)
    (= (burning F5) 2.821)
    (= (burning F6) 4.762)
    (= (burning F7) 4.463)
    (= (carrying D) 2.648)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
    (= (burning F6) 0.0)
    (= (burning F7) 0.0)
  ))
)
