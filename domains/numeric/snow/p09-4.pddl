(define (problem p09-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.612)
    (= (snow W_2) 7.073)
    (= (snow W_3) 4.023)
    (= (snow W_4) 9.051)
    (= (snow W_5) 6.406)
    (= (snow W_6) 4.081)
    (= (snow W_7) 3.543)
    (= (snow W_8) 9.332)
    (= (snow W_9) 6.790)
    (= (snow D_1) 9.788)
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
           (= (snow D_1) 0.0)
  ))
)
