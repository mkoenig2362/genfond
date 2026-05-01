(define (problem p03-4)
  (:domain delivery)

  (:objects p1 p2 p3 - package g - gripper t - target)

  (:init
    (= (x p1) 5.791)
    (= (x p2) 4.118)
    (= (x p3) 6.244)
    (= (x t) 0.000)
    (= (x g) 2.093)
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
