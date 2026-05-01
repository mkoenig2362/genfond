(define (problem p10-1)
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
    (= (burning F1) 2.568)
    (= (burning F2) 3.334)
    (= (burning F3) 4.758)
    (= (burning F4) 3.643)
    (= (burning F5) 3.951)
    (= (burning F6) 1.723)
    (= (burning F7) 2.902)
    (= (burning F8) 3.095)
    (= (burning F9) 2.121)
    (= (burning F10) 3.225)
    (= (carrying D) 0.469)
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
