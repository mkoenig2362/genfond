(define (problem p02-4)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 9.154)
    (= (x ROBOT2) 9.625)
    (= (x TARGET) 6.350)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
    )
  )
)
