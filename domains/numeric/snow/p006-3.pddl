(define (problem snow-006-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 10.0)
    (= (snow W_2) 8.0)
    (= (snow W_3) 10.0)
    (= (snow W_4) 6.0)
    (= (snow W_5) 5.0)
    (= (snow W_6) 8.0)
    (= (snow D_1) 9.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow D_1) 0.0)))
)
