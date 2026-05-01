(define (problem p02-2)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_target TARGET)
    (= (x ROBOT1) 1.331)
    (= (y ROBOT1) 4.650)
    (= (x ROBOT2) 3.500)
    (= (y ROBOT2) 0.529)
    (= (x TARGET) 2.151)
    (= (y TARGET) 1.136)
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
