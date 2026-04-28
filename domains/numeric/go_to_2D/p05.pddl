(define (problem p5)
  (:domain got_to)
  (:objects ROBOT1 - robot TARGET - target)
  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 0.0)
    (= (y ROBOT1) 6.0)
    (= (x TARGET) 0.0)
    (= (y TARGET) 0.0)
  )
  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
