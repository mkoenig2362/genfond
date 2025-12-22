(define (problem snow-09)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1)  1)
    (= (snow W_2)  2)
    (= (snow W_3)  3)
    (= (snow W_4)  4)
    (= (snow W_5)  5)
    (= (snow W_6)  6)
    (= (snow D_1)  1)
  )

  (:goal (and
           (= (snow W_1)  0)
           (= (snow W_2)  0)
           (= (snow W_3)  0)
           (= (snow W_4)  0)
           (= (snow W_5)  0)
           (= (snow W_6)  0)
           (= (snow D_1) 0)))
)