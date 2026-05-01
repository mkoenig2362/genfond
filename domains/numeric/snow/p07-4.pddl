(define (problem p07-4)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 9.040)
    (= (snow W_2) 5.724)
    (= (snow W_3) 5.452)
    (= (snow W_4) 2.415)
    (= (snow W_5) 9.433)
    (= (snow W_6) 4.012)
    (= (snow W_7) 2.773)
    (= (snow D_1) 3.079)
  )

  (:goal (and
           (= (snow W_1) 0.0)
           (= (snow W_2) 0.0)
           (= (snow W_3) 0.0)
           (= (snow W_4) 0.0)
           (= (snow W_5) 0.0)
           (= (snow W_6) 0.0)
           (= (snow W_7) 0.0)
           (= (snow D_1) 0.0)
  ))
)
