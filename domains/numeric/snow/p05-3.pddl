(define (problem p05-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.263)
    (= (snow W_2) 7.977)
    (= (snow W_3) 1.173)
    (= (snow W_4) 4.992)
    (= (snow W_5) 6.755)
    (= (snow D_1) 1.080)
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
