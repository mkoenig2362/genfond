(define (problem snow-002-2)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 1.0)
    (= (snow W_2) 9.0)
    (= (snow D_1) 4.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)))
)
