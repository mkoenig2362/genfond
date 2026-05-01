(define (problem p06-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.094)
    (= (snow W_2) 9.962)
    (= (snow W_3) 7.278)
    (= (snow W_4) 1.239)
    (= (snow W_5) 5.447)
    (= (snow W_6) 4.889)
    (= (snow D_1) 5.858)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow D_1) 0.0)
  ))
)
