(define (problem p9)
  (:domain got_to)
  (:objects ROBOT1 - robot TARGET - target)
  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 2)
    (= (x TARGET) 1)
  )
  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)