(define (problem p06-1)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    F6 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.179)
    (= (burning F2) 3.657)
    (= (burning F3) 1.993)
    (= (burning F4) 4.129)
    (= (burning F5) 4.324)
    (= (burning F6) 3.294)
    (= (carrying D) 4.797)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
    (= (burning F6) 0.0)
  ))
)
