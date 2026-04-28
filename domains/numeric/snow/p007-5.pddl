(define (problem snow-007-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.0)
    (= (snow W_2) 9.0)
    (= (snow W_3) 6.0)
    (= (snow W_4) 1.0)
    (= (snow W_5) 10.0)
    (= (snow W_6) 3.0)
    (= (snow W_7) 6.0)
    (= (snow D_1) 9.0)
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
