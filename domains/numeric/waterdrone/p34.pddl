(define (problem waterdrone-34)
  (:domain waterdrone)

  (:objects
    F1 - fire
    F2 - fire
    F3 - fire
    F4 - fire
    F5 - fire
    F6 - fire
    F7 - fire
    R - river
  )

  (:init
    (= (burning F1) 6.0)
    (= (burning F2) 1.0)
    (= (burning F3) 4.0)
    (= (burning F4) 7.0)
    (= (burning F5) 10.0)
    (= (burning F6) 8.0)
    (= (burning F7) 1.0)
    (= (carrying) 0.0)
    (at R)
    (same F1 F1)
    (same F2 F2)
    (same F3 F3)
    (same F4 F4)
    (same F5 F5)
    (same F6 F6)
    (same F7 F7)
  )

  (:goal (and
    (= (burning F1) 0.0)
    (= (burning F2) 0.0)
    (= (burning F3) 0.0)
    (= (burning F4) 0.0)
    (= (burning F5) 0.0)
    (= (burning F6) 0.0)
    (= (burning F7) 0.0)
  ))
)
