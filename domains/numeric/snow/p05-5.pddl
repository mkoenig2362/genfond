(define (problem p05-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.868)
    (= (snow W_2) 9.338)
    (= (snow W_3) 2.011)
    (= (snow W_4) 1.791)
    (= (snow W_5) 2.437)
    (= (snow D_1) 1.451)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow D_1) 0.0)
  ))
)
