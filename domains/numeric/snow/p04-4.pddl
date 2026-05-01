(define (problem p04-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.805)
    (= (snow W_2) 8.652)
    (= (snow W_3) 8.459)
    (= (snow W_4) 8.225)
    (= (snow D_1) 3.018)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)
  ))
)
