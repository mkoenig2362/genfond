(define (problem p02-2)
  (:domain delivery)

  (:objects p1 p2 - package g - gripper t - target)

  (:init
    (= (x p1) 1.890)
    (= (x p2) 9.724)
    (= (x t) 0.000)
    (= (x g) 3.193)
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
