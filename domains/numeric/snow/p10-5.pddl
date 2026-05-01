(define (problem p10-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.057)
    (= (snow W_2) 3.074)
    (= (snow W_3) 9.305)
    (= (snow W_4) 7.402)
    (= (snow W_5) 7.828)
    (= (snow W_6) 8.363)
    (= (snow W_7) 3.344)
    (= (snow W_8) 7.386)
    (= (snow W_9) 7.759)
    (= (snow W_10) 4.266)
    (= (snow D_1) 6.884)
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
