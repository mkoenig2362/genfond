(define (problem p04-1)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_target TARGET)
    (= (x ROBOT1) 4.961)
    (= (x ROBOT2) 8.876)
    (= (x ROBOT3) 8.150)
    (= (x ROBOT4) 8.176)
    (= (x TARGET) 9.664)
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
