(define (problem waterdrone-5)
  (:domain waterdrone)

  (:objects
    F1 - fire
    R - river
  )

  (:init
    (= (burning F1) 10.0)
    (= (carrying) 0.0)
    (at R)
    (same F1 F1)
  )

  (:goal (and
    (= (burning F1) 0.0)
  ))
)
