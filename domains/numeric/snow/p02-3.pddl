(define (problem p02-3)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.960)
    (= (snow W_2) 6.434)
    (= (snow D_1) 6.467)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)
  ))
)
