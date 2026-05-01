(define (problem p03-5)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 4.315)
    (= (burning F2) 4.211)
    (= (burning F3) 1.897)
    (= (carrying D) 3.629)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
  ))
)
