(define (problem p05-2)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_target TARGET)
    (= (x ROBOT1) 4.651)
    (= (x ROBOT2) 4.183)
    (= (x ROBOT3) 8.210)
    (= (x ROBOT4) 4.702)
    (= (x ROBOT5) 4.031)
    (= (x TARGET) 5.283)
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
