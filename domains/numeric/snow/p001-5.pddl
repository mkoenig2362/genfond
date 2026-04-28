(define (problem snow-001-5)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.0)
    (= (snow D_1) 7.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)))
)
