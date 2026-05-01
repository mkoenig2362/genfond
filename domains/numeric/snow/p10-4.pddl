(define (problem p10-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 W_10 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.160)
    (= (snow W_2) 2.481)
    (= (snow W_3) 9.174)
    (= (snow W_4) 9.255)
    (= (snow W_5) 3.071)
    (= (snow W_6) 9.910)
    (= (snow W_7) 7.332)
    (= (snow W_8) 1.430)
    (= (snow W_9) 8.837)
    (= (snow W_10) 4.844)
    (= (snow D_1) 4.822)
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
