(define (problem p04-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.532)
    (= (snow W_2) 1.881)
    (= (snow W_3) 2.232)
    (= (snow W_4) 4.385)
    (= (snow D_1) 3.212)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)
  ))
)
