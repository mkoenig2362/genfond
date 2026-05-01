(define (problem p06-4)
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
    (= (x ROBOT1) 8.160)
    (= (x ROBOT2) 4.804)
    (= (x ROBOT3) 1.260)
    (= (x ROBOT4) 1.139)
    (= (x ROBOT5) 8.501)
    (= (x ROBOT6) 7.115)
    (= (x TARGET) 5.332)
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
