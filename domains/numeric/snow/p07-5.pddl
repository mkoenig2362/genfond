(define (problem p07-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 8.047)
    (= (snow W_2) 3.598)
    (= (snow W_3) 7.069)
    (= (snow W_4) 6.710)
    (= (snow W_5) 9.472)
    (= (snow W_6) 8.332)
    (= (snow W_7) 9.562)
    (= (snow D_1) 2.946)
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
