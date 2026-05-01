(define (problem p02-4)
  (:domain delivery)

  (:objects p1 p2 - package g - gripper t - target)

  (:init
    (= (x p1) 9.154)
    (= (x p2) 9.625)
    (= (x t) 0.000)
    (= (x g) 6.350)
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
