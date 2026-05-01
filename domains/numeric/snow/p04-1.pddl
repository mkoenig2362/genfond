(define (problem p04-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.698)
    (= (snow W_2) 5.465)
    (= (snow W_3) 8.988)
    (= (snow W_4) 8.335)
    (= (snow D_1) 8.358)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)
  ))
)
