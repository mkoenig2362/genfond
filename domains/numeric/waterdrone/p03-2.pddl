(define (problem p03-2)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.984)
    (= (burning F2) 4.55)
    (= (burning F3) 4.26)
    (= (carrying D) 4.088)
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
