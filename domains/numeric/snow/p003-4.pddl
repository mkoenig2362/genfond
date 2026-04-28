(define (problem snow-003-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 8.0)
    (= (snow W_2) 5.0)
    (= (snow W_3) 3.0)
    (= (snow D_1) 5.0)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)))
)
