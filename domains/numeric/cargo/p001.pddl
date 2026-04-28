(define (problem cargo-1)
  (:domain cargo)

  (:objects
    B1 - box
    B2 - box
  )

  (:init
    (= (size B1) 2.0)
    (= (size B2) 3.0)
  )

  (:goal (and
           (in B1)
           (in B2)))
)
