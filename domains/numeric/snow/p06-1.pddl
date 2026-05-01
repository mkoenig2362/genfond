(define (problem p06-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.287)
    (= (snow W_2) 3.799)
    (= (snow W_3) 7.639)
    (= (snow W_4) 9.626)
    (= (snow W_5) 1.142)
    (= (snow W_6) 5.501)
    (= (snow D_1) 3.169)
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
