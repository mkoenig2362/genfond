(define (problem p10-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.777)
    (= (snow W_2) 5.321)
    (= (snow W_3) 3.460)
    (= (snow W_4) 5.459)
    (= (snow W_5) 3.372)
    (= (snow W_6) 2.794)
    (= (snow W_7) 9.084)
    (= (snow W_8) 6.507)
    (= (snow W_9) 1.787)
    (= (snow W_10) 4.069)
    (= (snow D_1) 1.633)
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
           (= (snow D_1) 0.0)
  ))
)
