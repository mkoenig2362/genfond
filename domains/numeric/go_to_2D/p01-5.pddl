(define (problem p01-5)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 3.037)
    (= (y ROBOT1) 3.175)
    (= (x TARGET) 1.645)
    (= (y TARGET) 3.019)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
