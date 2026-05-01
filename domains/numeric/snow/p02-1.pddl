(define (problem p02-1)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.380)
    (= (snow W_2) 8.427)
    (= (snow D_1) 9.818)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)
  ))
)
