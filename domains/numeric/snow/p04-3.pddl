(define (problem p04-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.651)
    (= (snow W_2) 1.061)
    (= (snow W_3) 1.081)
    (= (snow W_4) 6.283)
    (= (snow D_1) 4.699)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)
  ))
)
