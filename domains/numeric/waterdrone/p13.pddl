(define (problem waterdrone-13)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    R - river
  )

  (:init
    (= (burning F1) 7.0)
    (= (burning F2) 6.0)
    (= (burning F3) 9.0)
    (= (carrying) 0.0)
    (at R)
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
