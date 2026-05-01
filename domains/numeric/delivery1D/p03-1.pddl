(define (problem p03-1)
  (:domain delivery)

  (:objects p1 p2 p3 - package g - gripper t - target)

  (:init
    (= (x p1) 4.303)
    (= (x p2) 2.272)
    (= (x p3) 2.662)
    (= (x t) 0.000)
    (= (x g) 6.431)
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
