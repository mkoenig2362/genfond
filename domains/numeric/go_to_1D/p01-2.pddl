(define (problem p01-2)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 2.425)
    (= (x TARGET) 6.374)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
