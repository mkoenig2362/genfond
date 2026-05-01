(define (problem p03-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.883)
    (= (snow W_2) 6.212)
    (= (snow W_3) 4.706)
    (= (snow D_1) 6.620)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)
  ))
)
