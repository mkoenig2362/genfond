(define (problem p04-4)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_target TARGET)
    (= (x ROBOT1) 8.503)
    (= (x ROBOT2) 8.288)
    (= (x ROBOT3) 8.028)
    (= (x ROBOT4) 2.242)
    (= (x TARGET) 9.783)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (x ROBOT4) (x TARGET))
    )
  )
)
