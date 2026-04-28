(define (problem p1)
  (:domain got_to)
  (:objects ROBOT1 - robot TARGET - target)
  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 8.0)
    (= (x TARGET) 0.0)
  )
  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
