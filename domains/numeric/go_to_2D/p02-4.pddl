(define (problem p02-4)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 3.122)
    (= (y ROBOT1) 3.480)
    (= (x ROBOT2) 4.097)
    (= (y ROBOT2) 4.266)
    (= (x TARGET) 2.895)
    (= (y TARGET) 2.059)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
      (= (x ROBOT2) (x TARGET))
      (= (y ROBOT2) (y TARGET))
    )
  )
)
