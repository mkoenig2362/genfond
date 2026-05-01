(define (problem p03-4)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 2.434)
    (= (burning F2) 4.619)
    (= (burning F3) 3.724)
    (= (carrying D) 2.364)
    (at F3)
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
