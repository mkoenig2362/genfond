(define (problem p10-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.317)
    (= (snow W_2) 4.305)
    (= (snow W_3) 1.509)
    (= (snow W_4) 1.647)
    (= (snow W_5) 4.943)
    (= (snow W_6) 9.864)
    (= (snow W_7) 3.630)
    (= (snow W_8) 9.298)
    (= (snow W_9) 2.045)
    (= (snow W_10) 8.341)
    (= (snow D_1) 2.149)
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
