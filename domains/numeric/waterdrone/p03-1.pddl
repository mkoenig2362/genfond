(define (problem p03-1)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
    D - drone
  )

  (:init
    (= (burning F1) 3.498)
    (= (burning F2) 3.784)
    (= (burning F3) 4.278)
    (= (carrying D) 4.266)
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
