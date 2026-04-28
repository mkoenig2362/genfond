(define (problem snow-002-1)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.0)
    (= (snow W_2) 2.0)
    (= (snow D_1) 8.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)))
)
