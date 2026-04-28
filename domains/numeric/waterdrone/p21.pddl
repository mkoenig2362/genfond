(define (problem waterdrone-21)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    R - river
  )

  (:init
    (= (burning F1) 7.0)
    (= (burning F2) 9.0)
    (= (burning F3) 5.0)
    (= (burning F4) 3.0)
    (= (burning F5) 9.0)
    (= (carrying) 0.0)
    (at R)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
  ))
)
