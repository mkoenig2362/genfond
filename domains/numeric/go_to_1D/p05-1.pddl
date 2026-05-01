(define (problem p05-1)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_target TARGET)
    (= (x ROBOT1) 5.179)
    (= (x ROBOT2) 9.658)
    (= (x ROBOT3) 0.787)
    (= (x ROBOT4) 2.371)
    (= (x ROBOT5) 9.263)
    (= (x TARGET) 0.335)
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
