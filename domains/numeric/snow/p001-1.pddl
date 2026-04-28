(define (problem snow-001-1)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.0)
    (= (snow D_1) 5.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)))
)
