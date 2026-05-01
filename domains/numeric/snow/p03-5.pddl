(define (problem p03-5)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 7.264)
    (= (snow W_2) 8.375)
    (= (snow W_3) 8.679)
    (= (snow D_1) 6.629)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow D_1) 0.0)
  ))
)
