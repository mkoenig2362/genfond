(define (problem p03-4)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 2.642)
    (= (y ROBOT1) 2.325)
    (= (x ROBOT2) 2.091)
    (= (y ROBOT2) 4.105)
    (= (x ROBOT3) 2.351)
    (= (y ROBOT3) 2.015)
    (= (x TARGET) 1.186)
    (= (y TARGET) 4.632)
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
