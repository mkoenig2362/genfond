(define (problem p01-4)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 1.767)
    (= (snow D_1) 3.856)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)
  ))
)
