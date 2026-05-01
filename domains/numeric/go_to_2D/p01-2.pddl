(define (problem p01-2)
  (:domain got_to)

  (:objects ROBOT1 - robot TARGET - target)

  (:init
    (is_robot ROBOT1)
    (is_target TARGET)
    (= (x ROBOT1) 0.426)
    (= (y ROBOT1) 1.587)
    (= (x TARGET) 2.366)
    (= (y TARGET) 4.852)
  )

  (:goal
    (and
      (= (x ROBOT1) (x TARGET))
      (= (y ROBOT1) (y TARGET))
    )
  )
)
