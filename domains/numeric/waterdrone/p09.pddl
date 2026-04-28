(define (problem waterdrone-9)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    R - river
  )

  (:init
    (= (burning F1) 2.0)
    (= (burning F2) 8.0)
    (= (carrying) 0.0)
    (at R)
    (same F1 F1)
    (same F2 F2)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
  ))
)
