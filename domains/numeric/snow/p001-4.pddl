(define (problem snow-001-4)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.0)
    (= (snow D_1) 1.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)))
)
