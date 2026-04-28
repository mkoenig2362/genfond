(define (problem snow-010-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 10.0)
    (= (snow W_2) 3.0)
    (= (snow W_3) 3.0)
    (= (snow W_4) 10.0)
    (= (snow W_5) 3.0)
    (= (snow W_6) 4.0)
    (= (snow W_7) 2.0)
    (= (snow W_8) 2.0)
    (= (snow W_9) 6.0)
    (= (snow W_10) 9.0)
    (= (snow D_1) 1.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow W_8) 0.0)
           (= (snow W_9) 0.0)
           (= (snow W_10) 0.0)
           (= (snow D_1) 0.0)))
)
