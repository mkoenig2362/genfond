(define (problem p01-2)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 0.852)
    (= (y p1) 3.174)
    (= (x t) 0.000)
    (= (y t) 0.000)
    (= (x g) 4.732)
    (= (y g) 9.703)
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
