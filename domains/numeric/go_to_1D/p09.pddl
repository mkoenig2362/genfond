(define (problem p9)
  (:domain got_to)
  (:objects ROBOT1 ROBOT2 - robot TARGET - target)
  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 10.0)
    (= (x ROBOT2) 2.0)
    (= (x TARGET) 0.0)
  )
  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
    )
  )
)
