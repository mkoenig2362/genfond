(define (problem p06-4)
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
    (= (burning F1) 2.225)
    (= (burning F2) 1.47)
    (= (burning F3) 1.671)
    (= (burning F4) 4.082)
    (= (burning F5) 3.028)
    (= (burning F6) 1.122)
    (= (carrying D) 0.961)
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
