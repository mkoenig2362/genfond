(define (problem p09-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.892)
    (= (snow W_2) 1.284)
    (= (snow W_3) 3.210)
    (= (snow W_4) 9.946)
    (= (snow W_5) 5.683)
    (= (snow W_6) 1.018)
    (= (snow W_7) 7.041)
    (= (snow W_8) 4.328)
    (= (snow W_9) 1.875)
    (= (snow D_1) 9.408)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow W_8) 0.0)
           (= (snow W_9) 0.0)
           (= (snow D_1) 0.0)
  ))
)
