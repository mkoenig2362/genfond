(define (problem p03-3)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.282)
    (= (burning F2) 3.066)
    (= (burning F3) 1.373)
    (= (carrying D) 1.839)
    (at F1)
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
