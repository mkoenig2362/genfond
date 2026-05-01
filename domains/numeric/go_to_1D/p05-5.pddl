(define (problem p05-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_target TARGET)
    (= (x ROBOT1) 9.265)
    (= (x ROBOT2) 1.123)
    (= (x ROBOT3) 0.879)
    (= (x ROBOT4) 1.596)
    (= (x ROBOT5) 0.502)
    (= (x TARGET) 4.298)
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
