(define (problem p05-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 1.302)
    (= (snow W_2) 5.661)
    (= (snow W_3) 9.692)
    (= (snow W_4) 1.709)
    (= (snow W_5) 3.134)
    (= (snow D_1) 9.337)
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
