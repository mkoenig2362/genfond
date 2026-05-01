(define (problem p07-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 1.014)
    (= (snow W_2) 3.537)
    (= (snow W_3) 9.311)
    (= (snow W_4) 8.233)
    (= (snow W_5) 6.999)
    (= (snow W_6) 9.676)
    (= (snow W_7) 5.368)
    (= (snow D_1) 7.819)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow D_1) 0.0)
  ))
)
