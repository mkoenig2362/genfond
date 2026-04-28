(define (problem snow-001-3)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 10.0)
    (= (snow D_1) 4.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)))
)
