(define (problem p01-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.154)
    (= (carrying D) 1.122)
    (at F1)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
