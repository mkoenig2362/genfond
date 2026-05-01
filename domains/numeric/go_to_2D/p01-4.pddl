(define (problem p01-4)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 0.945)
    (= (y ROBOT1) 4.862)
    (= (x TARGET) 4.899)
    (= (y TARGET) 1.597)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
