(define (problem p05-3)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_target TARGET)
    (= (x ROBOT1) 7.752)
    (= (x ROBOT2) 0.192)
    (= (x ROBOT3) 4.435)
    (= (x ROBOT4) 6.394)
    (= (x ROBOT5) 0.088)
    (= (x TARGET) 3.625)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (x ROBOT4) (x TARGET))
      (= (x ROBOT5) (x TARGET))
    )
  )
)
