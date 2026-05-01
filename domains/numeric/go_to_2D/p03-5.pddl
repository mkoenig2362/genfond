(define (problem p03-5)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 0.096)
    (= (y ROBOT1) 2.218)
    (= (x ROBOT2) 3.197)
    (= (y ROBOT2) 0.044)
    (= (x ROBOT3) 1.584)
    (= (y ROBOT3) 1.734)
    (= (x TARGET) 1.813)
    (= (y TARGET) 3.876)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (y ROBOT2) (y TARGET))
      (= (x ROBOT3) (x TARGET))
      (= (y ROBOT3) (y TARGET))
    )
  )
)
