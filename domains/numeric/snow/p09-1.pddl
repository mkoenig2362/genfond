(define (problem p09-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 W_9 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 4.038)
    (= (snow W_2) 4.357)
    (= (snow W_3) 3.798)
    (= (snow W_4) 3.766)
    (= (snow W_5) 5.268)
    (= (snow W_6) 2.392)
    (= (snow W_7) 1.966)
    (= (snow W_8) 9.086)
    (= (snow W_9) 6.932)
    (= (snow D_1) 8.238)
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
