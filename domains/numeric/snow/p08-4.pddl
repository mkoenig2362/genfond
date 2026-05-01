(define (problem p08-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 8.759)
    (= (snow W_2) 8.121)
    (= (snow W_3) 2.093)
    (= (snow W_4) 9.812)
    (= (snow W_5) 6.977)
    (= (snow W_6) 5.801)
    (= (snow W_7) 5.263)
    (= (snow W_8) 8.276)
    (= (snow D_1) 3.693)
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
           (= (snow D_1) 0.0)
  ))
)
