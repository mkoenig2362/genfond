(define (problem p06-2)
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
    (= (burning F1) 4.907)
    (= (burning F2) 1.197)
    (= (burning F3) 3.247)
    (= (burning F4) 1.739)
    (= (burning F5) 1.46)
    (= (burning F6) 2.106)
    (= (carrying D) 1.9)
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
