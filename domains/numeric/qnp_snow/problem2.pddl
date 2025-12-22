(define (problem snow-02)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1)  2)
    (= (snow W_2)  2)
    (= (snow D_1) 3)
  )

  (:goal (and
           (= (snow W_1)  0)
           (= (snow W_2)  0)
           (= (snow D_1) 0)))
)