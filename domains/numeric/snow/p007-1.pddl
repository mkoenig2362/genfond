(define (problem snow-007-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.0)
    (= (snow W_2) 7.0)
    (= (snow W_3) 4.0)
    (= (snow W_4) 5.0)
    (= (snow W_5) 5.0)
    (= (snow W_6) 10.0)
    (= (snow W_7) 1.0)
    (= (snow D_1) 6.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow D_1) 0.0)))
)
