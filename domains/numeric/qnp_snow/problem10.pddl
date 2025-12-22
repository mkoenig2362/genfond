(define (problem snow-10)
  (:domain snow)

  (:objects
    W_1 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 20)
    (= (snow D_1) 20)
  )

  (:goal (and
           (= (snow W_1)  0)
           (= (snow D_1) 0)))
)