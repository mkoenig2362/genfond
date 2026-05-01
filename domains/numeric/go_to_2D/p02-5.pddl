(define (problem p02-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 2.481)
    (= (y ROBOT1) 4.438)
    (= (x ROBOT2) 4.075)
    (= (y ROBOT2) 4.088)
    (= (x TARGET) 3.127)
    (= (y TARGET) 4.832)
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
