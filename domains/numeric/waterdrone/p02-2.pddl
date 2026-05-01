(define (problem p02-2)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 4.175)
    (= (burning F2) 3.572)
    (= (carrying D) 2.151)
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
