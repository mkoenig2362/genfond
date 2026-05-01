(define (problem p01-3)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.259)
    (= (snow D_1) 9.733)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)
  ))
)
