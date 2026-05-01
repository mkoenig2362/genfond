(define (problem p02-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 8.249)
    (= (x ROBOT2) 7.938)
    (= (x TARGET) 6.931)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
    )
  )
)
