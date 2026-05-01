(define (problem p02-1)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 3.466)
    (= (y ROBOT1) 4.125)
    (= (x ROBOT2) 3.969)
    (= (y ROBOT2) 3.216)
    (= (x TARGET) 4.577)
    (= (y TARGET) 4.812)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (y ROBOT2) (y TARGET))
    )
  )
)
