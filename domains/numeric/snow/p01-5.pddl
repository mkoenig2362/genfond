(define (problem p01-5)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.088)
    (= (snow D_1) 1.767)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)
  ))
)
