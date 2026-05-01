(define (problem p06-2)
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
    (= (x ROBOT1) 9.958)
    (= (x ROBOT2) 6.975)
    (= (x ROBOT3) 0.266)
    (= (x ROBOT4) 4.941)
    (= (x ROBOT5) 4.321)
    (= (x ROBOT6) 5.398)
    (= (x TARGET) 8.993)
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
