(define (problem p07-2)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 3.241)
    (= (snow W_2) 9.791)
    (= (snow W_3) 1.443)
    (= (snow W_4) 6.055)
    (= (snow W_5) 2.663)
    (= (snow W_6) 2.034)
    (= (snow W_7) 3.488)
    (= (snow D_1) 4.419)
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
