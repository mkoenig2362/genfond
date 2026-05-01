(define (problem p10-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.215)
    (= (snow W_2) 9.992)
    (= (snow W_3) 6.849)
    (= (snow W_4) 4.688)
    (= (snow W_5) 7.068)
    (= (snow W_6) 1.891)
    (= (snow W_7) 5.850)
    (= (snow W_8) 6.555)
    (= (snow W_9) 7.723)
    (= (snow W_10) 9.263)
    (= (snow D_1) 1.536)
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
