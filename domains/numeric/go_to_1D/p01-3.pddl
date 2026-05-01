(define (problem p01-3)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 9.703)
    (= (x TARGET) 4.732)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
    )
  )
)
