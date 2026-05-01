(define (problem p06-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.299)
    (= (snow W_2) 5.631)
    (= (snow W_3) 2.104)
    (= (snow W_4) 6.037)
    (= (snow W_5) 1.252)
    (= (snow W_6) 3.703)
    (= (snow D_1) 5.363)
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
