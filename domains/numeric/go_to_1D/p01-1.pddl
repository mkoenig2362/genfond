(define (problem p01-1)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 2.662)
    (= (x TARGET) 4.975)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
