(define (problem p04-3)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_target TARGET)
    (= (x ROBOT1) 0.067)
    (= (x ROBOT2) 0.090)
    (= (x ROBOT3) 5.870)
    (= (x ROBOT4) 4.110)
    (= (x TARGET) 5.167)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (x ROBOT4) (x TARGET))
    )
  )
)
