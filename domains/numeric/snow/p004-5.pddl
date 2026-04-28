(define (problem snow-004-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.0)
    (= (snow W_2) 8.0)
    (= (snow W_3) 8.0)
    (= (snow W_4) 5.0)
    (= (snow D_1) 8.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)))
)
