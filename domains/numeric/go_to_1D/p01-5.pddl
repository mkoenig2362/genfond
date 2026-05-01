(define (problem p01-5)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 0.852)
    (= (x TARGET) 6.764)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
