(define (problem p09-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.015)
    (= (snow W_2) 9.012)
    (= (snow W_3) 4.875)
    (= (snow W_4) 5.264)
    (= (snow W_5) 1.199)
    (= (snow W_6) 2.896)
    (= (snow W_7) 6.672)
    (= (snow W_8) 7.872)
    (= (snow W_9) 3.750)
    (= (snow D_1) 8.350)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow W_8) 0.0)
           (= (snow W_9) 0.0)
           (= (snow D_1) 0.0)
  ))
)
