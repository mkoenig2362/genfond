(define (problem p08-1)
  (:domain snow)

  (:objects
    W_1 W_2 W_3 W_4 W_5 W_6 W_7 W_8 - ww
    D_1 - dw
  )

  (:init
    (= (snow W_1) 1.344)
    (= (snow W_2) 1.271)
    (= (snow W_3) 2.757)
    (= (snow W_4) 1.786)
    (= (snow W_5) 2.312)
    (= (snow W_6) 7.335)
    (= (snow W_7) 4.961)
    (= (snow W_8) 3.316)
    (= (snow D_1) 5.485)
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
