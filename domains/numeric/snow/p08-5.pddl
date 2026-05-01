(define (problem p08-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.014)
    (= (snow W_2) 4.481)
    (= (snow W_3) 6.036)
    (= (snow W_4) 6.446)
    (= (snow W_5) 5.755)
    (= (snow W_6) 6.330)
    (= (snow W_7) 1.340)
    (= (snow W_8) 2.957)
    (= (snow D_1) 4.456)
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
           (= (snow D_1) 0.0)
  ))
)
