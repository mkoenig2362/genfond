(define (problem p06-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 ROBOT4 ROBOT5 ROBOT6 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_robot ROBOT4)
    (is_robot ROBOT5)
    (is_robot ROBOT6)
    (is_target TARGET)
    (= (x ROBOT1) 5.146)
    (= (x ROBOT2) 1.227)
    (= (x ROBOT3) 5.597)
    (= (x ROBOT4) 0.280)
    (= (x ROBOT5) 3.003)
    (= (x ROBOT6) 4.847)
    (= (x TARGET) 2.554)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (x ROBOT4) (x TARGET))
      (= (x ROBOT5) (x TARGET))
      (= (x ROBOT6) (x TARGET))
    )
  )
)
