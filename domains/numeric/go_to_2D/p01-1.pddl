(define (problem p01-1)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 3.187)
    (= (y ROBOT1) 1.212)
    (= (x TARGET) 2.488)
    (= (y TARGET) 1.331)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
