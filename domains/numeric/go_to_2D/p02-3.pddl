(define (problem p02-3)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 3.462)
    (= (y ROBOT1) 2.300)
    (= (x ROBOT2) 1.348)
    (= (y ROBOT2) 1.046)
    (= (x TARGET) 4.554)
    (= (y TARGET) 1.355)
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
