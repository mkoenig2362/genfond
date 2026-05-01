(define (problem p02-5)
  (:domain delivery)

  (:objects p1 p2 - package g - gripper t - target)

  (:init
    (= (x p1) 8.249)
    (= (x p2) 7.938)
    (= (x t) 0.000)
    (= (x g) 6.931)
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
