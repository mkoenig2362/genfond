(define (problem p06-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.799)
    (= (snow W_2) 8.344)
    (= (snow W_3) 5.323)
    (= (snow W_4) 2.134)
    (= (snow W_5) 2.025)
    (= (snow W_6) 8.651)
    (= (snow D_1) 7.404)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow D_1) 0.0)
  ))
)
