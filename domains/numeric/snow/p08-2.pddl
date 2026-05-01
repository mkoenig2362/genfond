(define (problem p08-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 2.903)
    (= (snow W_2) 4.249)
    (= (snow W_3) 4.491)
    (= (snow W_4) 1.516)
    (= (snow W_5) 9.482)
    (= (snow W_6) 9.038)
    (= (snow W_7) 4.242)
    (= (snow W_8) 6.617)
    (= (snow D_1) 1.215)
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
           (= (snow D_1) 0.0)
  ))
)
