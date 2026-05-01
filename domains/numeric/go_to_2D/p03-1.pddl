(define (problem p03-1)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 2.583)
    (= (y ROBOT1) 0.466)
    (= (x ROBOT2) 1.839)
    (= (y ROBOT2) 2.584)
    (= (x ROBOT3) 0.034)
    (= (y ROBOT3) 0.045)
    (= (x TARGET) 0.626)
    (= (y TARGET) 2.852)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (y ROBOT2) (y TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (y ROBOT3) (y TARGET))
    )
  )
)
