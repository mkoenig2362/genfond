(define (problem p03-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.370)
    (= (snow W_2) 7.301)
    (= (snow W_3) 1.952)
    (= (snow D_1) 9.197)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)
  ))
)
