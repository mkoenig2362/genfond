(define (problem p06-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.013)
    (= (snow W_2) 1.241)
    (= (snow W_3) 6.445)
    (= (snow W_4) 8.439)
    (= (snow W_5) 4.018)
    (= (snow W_6) 4.402)
    (= (snow D_1) 1.400)
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
