(define (problem cargo-1)
  (:domain cargo)

  (:objects
    B1 - box
    B2 - box
    B3 - box
    B4 - box
  )

  (:init
    (= (size B1) 2.0)
    (= (size B2) 3.0)
    (= (size B3) 7.0)
    (= (size B4) 4.0)
  )

  (:goal (and
           (in B1)
           (in B2)))
)
