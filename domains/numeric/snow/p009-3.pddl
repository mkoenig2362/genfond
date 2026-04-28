(define (problem snow-009-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.0)
    (= (snow W_2) 2.0)
    (= (snow W_3) 4.0)
    (= (snow W_4) 2.0)
    (= (snow W_5) 3.0)
    (= (snow W_6) 1.0)
    (= (snow W_7) 10.0)
    (= (snow W_8) 10.0)
    (= (snow W_9) 1.0)
    (= (snow D_1) 2.0)
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
           (= (snow D_1) 0.0)))
)
