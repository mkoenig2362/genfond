(define (problem p02-4)
  (:domain snow)

  (:objects
    W_1 W_2 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 6.715)
    (= (snow W_2) 9.239)
    (= (snow D_1) 9.662)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow D_1) 0.0)
  ))
)
