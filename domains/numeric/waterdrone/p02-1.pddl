(define (problem p02-1)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.54)
    (= (burning F2) 4.662)
    (= (carrying D) 4.812)
    (at F2)
    (same F1 F1)
    (same F2 F2)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
  ))
)
