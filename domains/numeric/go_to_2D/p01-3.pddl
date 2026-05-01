(define (problem p01-3)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 0.767)
    (= (y ROBOT1) 4.126)
    (= (x TARGET) 3.382)
    (= (y TARGET) 0.426)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
