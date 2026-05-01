(define (problem p04-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_target TARGET)
    (= (x ROBOT1) 0.979)
    (= (x ROBOT2) 1.369)
    (= (x ROBOT3) 3.761)
    (= (x ROBOT4) 2.458)
    (= (x TARGET) 7.258)
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
