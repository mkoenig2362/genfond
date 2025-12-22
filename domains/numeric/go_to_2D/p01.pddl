(define (problem p1)
  (:domain got_to)
  (:objects ROBOT1 - robot TARGET - target)
  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 2) (= (y ROBOT1) 3)
    (= (x TARGET) 0) (= (y TARGET) 0)
  )
  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)