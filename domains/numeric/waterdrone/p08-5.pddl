(define (problem p08-5)
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
    (= (burning F1) 4.064)
    (= (burning F2) 2.841)
    (= (burning F3) 4.638)
    (= (burning F4) 4.022)
    (= (burning F5) 2.315)
    (= (burning F6) 2.497)
    (= (burning F7) 3.318)
    (= (burning F8) 4.996)
    (= (carrying D) 3.25)
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
