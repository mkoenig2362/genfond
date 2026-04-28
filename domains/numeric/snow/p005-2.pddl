(define (problem snow-005-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.0)
    (= (snow W_2) 5.0)
    (= (snow W_3) 7.0)
    (= (snow W_4) 4.0)
    (= (snow W_5) 4.0)
    (= (snow D_1) 8.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow D_1) 0.0)))
)
