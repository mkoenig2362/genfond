(define (problem p01-4)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 3.174)
    (= (x TARGET) 0.852)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
