(define (problem p08-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.398)
    (= (snow W_2) 6.361)
    (= (snow W_3) 4.810)
    (= (snow W_4) 2.057)
    (= (snow W_5) 5.327)
    (= (snow W_6) 3.217)
    (= (snow W_7) 6.637)
    (= (snow W_8) 7.230)
    (= (snow D_1) 5.944)
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
