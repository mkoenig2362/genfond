(define (problem p03-3)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.440)
    (= (snow W_2) 7.232)
    (= (snow W_3) 5.140)
    (= (snow D_1) 3.427)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)
  ))
)
