(define (problem p03-2)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 7.001)
    (= (x ROBOT2) 1.058)
    (= (x ROBOT3) 9.108)
    (= (x TARGET) 9.300)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
    )
  )
)
