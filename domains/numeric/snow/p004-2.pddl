(define (problem snow-004-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.0)
    (= (snow W_2) 9.0)
    (= (snow W_3) 5.0)
    (= (snow W_4) 3.0)
    (= (snow D_1) 9.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)))
)
