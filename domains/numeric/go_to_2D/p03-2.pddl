(define (problem p03-2)
  (:domain got_to)

  (:objects ROBOT1 ROBOT2 ROBOT3 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_robot ROBOT2)
    (is_robot ROBOT3)
    (is_target TARGET)
    (= (x ROBOT1) 4.892)
    (= (y ROBOT1) 4.251)
    (= (x ROBOT2) 4.144)
    (= (y ROBOT2) 4.014)
    (= (x ROBOT3) 1.121)
    (= (y ROBOT3) 3.629)
    (= (x TARGET) 2.935)
    (= (y TARGET) 2.055)
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
