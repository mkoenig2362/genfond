(define (problem p01-1)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 6.374)
    (= (y p1) 2.425)
    (= (x t) 0.000)
    (= (y t) 0.000)
    (= (x g) 4.975)
    (= (y g) 2.662)
    (is_p p1)
    (is_g g)
    (is_t t)
    (free)
  )

  (:goal (and
    (= (x p1) (x t))
    (= (y p1) (y t))
    (free)
    (not (holding p1))
  ))
)
