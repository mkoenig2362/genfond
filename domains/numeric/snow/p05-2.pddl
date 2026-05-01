(define (problem p05-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.755)
    (= (snow W_2) 5.186)
    (= (snow W_3) 4.764)
    (= (snow W_4) 8.389)
    (= (snow W_5) 5.232)
    (= (snow D_1) 4.628)
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
