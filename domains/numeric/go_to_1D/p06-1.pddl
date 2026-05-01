(define (problem p06-1)
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
    (= (x ROBOT1) 3.110)
    (= (x ROBOT2) 7.377)
    (= (x ROBOT3) 9.584)
    (= (x ROBOT4) 0.158)
    (= (x ROBOT5) 5.002)
    (= (x ROBOT6) 2.410)
    (= (x TARGET) 1.430)
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
