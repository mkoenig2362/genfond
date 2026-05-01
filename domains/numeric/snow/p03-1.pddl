(define (problem p03-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.788)
    (= (snow W_2) 4.873)
    (= (snow W_3) 3.045)
    (= (snow D_1) 3.396)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)
  ))
)
