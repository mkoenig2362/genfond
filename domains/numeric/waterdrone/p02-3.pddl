(define (problem p02-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.065)
    (= (burning F2) 4.72)
    (= (carrying D) 3.5)
    (at R)
    (atRiver)
    (same F1 F1)
    (same F2 F2)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
  ))
)
