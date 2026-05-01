(define (problem p02-5)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.238)
    (= (snow W_2) 8.424)
    (= (snow D_1) 8.144)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)
  ))
)
