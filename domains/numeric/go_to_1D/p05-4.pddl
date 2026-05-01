(define (problem p05-4)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_target TARGET)
    (= (x ROBOT1) 3.468)
    (= (x ROBOT2) 6.449)
    (= (x ROBOT3) 5.195)
    (= (x ROBOT4) 4.978)
    (= (x ROBOT5) 3.015)
    (= (x TARGET) 3.168)
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
