(define (problem p04-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.126)
    (= (snow W_2) 6.134)
    (= (snow W_3) 5.649)
    (= (snow W_4) 1.838)
    (= (snow D_1) 4.310)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow D_1) 0.0)
  ))
)
