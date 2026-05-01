(define (problem p03-3)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 6.925)
    (= (x ROBOT2) 4.600)
    (= (x ROBOT3) 2.697)
    (= (x TARGET) 2.711)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
    )
  )
)
