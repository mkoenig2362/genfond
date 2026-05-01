(define (problem p02-3)
  (:domain delivery)

  (:objects p1 p2 - package g - gripper t - target)

  (:init
    (= (x p1) 6.038)
    (= (x p2) 6.075)
    (= (x t) 0.000)
    (= (x g) 3.289)
    (is_p p1)
    (is_p p2)
    (is_g g)
    (is_t t)
    (free)
  )

  (:goal (and
    (= (x p1) (x t))
    (= (x p2) (x t))
    (free)
    (not (holding p1))
    (not (holding p2))
  ))
)
