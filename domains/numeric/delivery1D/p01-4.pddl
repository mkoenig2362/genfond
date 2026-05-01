(define (problem p01-4)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 3.174)
    (= (x t) 0.000)
    (= (x g) 0.852)
    (is_p p1)
    (is_g g)
    (is_t t)
    (free)
  )

  (:goal (and
    (= (x p1) (x t))
    (free)
    (not (holding p1))
  ))
)
