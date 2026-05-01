(define (problem p07-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.190)
    (= (snow W_2) 3.652)
    (= (snow W_3) 6.977)
    (= (snow W_4) 3.235)
    (= (snow W_5) 8.041)
    (= (snow W_6) 8.480)
    (= (snow W_7) 6.161)
    (= (snow D_1) 9.634)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow D_1) 0.0)
  ))
)
