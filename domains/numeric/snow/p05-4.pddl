(define (problem p05-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.851)
    (= (snow W_2) 4.121)
    (= (snow W_3) 6.804)
    (= (snow W_4) 5.675)
    (= (snow W_5) 5.480)
    (= (snow D_1) 3.713)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow D_1) 0.0)
  ))
)
