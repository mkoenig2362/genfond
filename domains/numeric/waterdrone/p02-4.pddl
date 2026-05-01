(define (problem p02-4)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 4.643)
    (= (burning F2) 2.084)
    (= (carrying D) 3.462)
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
