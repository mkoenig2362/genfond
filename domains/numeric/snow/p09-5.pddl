(define (problem p09-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.615)
    (= (snow W_2) 4.858)
    (= (snow W_3) 7.217)
    (= (snow W_4) 9.807)
    (= (snow W_5) 7.894)
    (= (snow W_6) 5.142)
    (= (snow W_7) 9.186)
    (= (snow W_8) 7.799)
    (= (snow W_9) 3.959)
    (= (snow D_1) 4.368)
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
