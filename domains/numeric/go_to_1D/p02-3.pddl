(define (problem p02-3)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 6.038)
    (= (x ROBOT2) 6.075)
    (= (x TARGET) 3.289)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
    )
  )
)
