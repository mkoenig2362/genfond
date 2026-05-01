(define (problem p02-2)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.874)
    (= (snow W_2) 2.701)
    (= (snow D_1) 9.751)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)
  ))
)
