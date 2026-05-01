(define (problem p03-5)
  (:domain delivery)

  (:objects p1 p2 p3 - package g - gripper t - target)

  (:init
    (= (x p1) 8.194)
    (= (x p2) 8.532)
    (= (x p3) 6.255)
    (= (x t) 0.000)
    (= (x g) 6.960)
    (is_p p1)
    (is_p p2)
    (is_p p3)
    (is_g g)
    (is_t t)
    (free)
  )

  (:goal (and
    (= (x p1) (x t))
    (= (x p2) (x t))
    (= (x p3) (x t))
    (free)
    (not (holding p1))
    (not (holding p2))
    (not (holding p3))
  ))
)
