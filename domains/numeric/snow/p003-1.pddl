(define (problem snow-003-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.0)
    (= (snow W_2) 1.0)
    (= (snow W_3) 4.0)
    (= (snow D_1) 10.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)))
)
