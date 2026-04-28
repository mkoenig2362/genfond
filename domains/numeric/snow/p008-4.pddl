(define (problem snow-008-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.0)
    (= (snow W_2) 5.0)
    (= (snow W_3) 1.0)
    (= (snow W_4) 7.0)
    (= (snow W_5) 5.0)
    (= (snow W_6) 2.0)
    (= (snow W_7) 8.0)
    (= (snow W_8) 5.0)
    (= (snow D_1) 2.0)
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
           (= (snow D_1) 0.0)))
)
