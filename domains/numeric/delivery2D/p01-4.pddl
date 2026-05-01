(define (problem p01-4)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 1.890)
    (= (y p1) 9.724)
    (= (x t) 0.000)
    (= (y t) 0.000)
    (= (x g) 9.797)
    (= (y g) 3.193)
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
