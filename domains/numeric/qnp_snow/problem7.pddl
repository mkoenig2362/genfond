(define (problem snow-07)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1)  1)
    (= (snow W_2)  10)
    (= (snow D_1) 13)
  )

  (:goal (and
           (= (snow W_1)  0)
           (= (snow W_2)  0)
           (= (snow D_1) 0)))
)