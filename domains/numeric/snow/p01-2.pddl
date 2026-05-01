(define (problem p01-2)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.737)
    (= (snow D_1) 3.182)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)
  ))
)
