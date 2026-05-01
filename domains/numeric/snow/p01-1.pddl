(define (problem p01-1)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 5.478)
    (= (snow D_1) 3.396)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow D_1) 0.0)
  ))
)
