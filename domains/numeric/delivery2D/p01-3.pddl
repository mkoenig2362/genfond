(define (problem p01-3)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 1.533)
    (= (y p1) 8.253)
    (= (x t) 0.000)
    (= (y t) 0.000)
    (= (x g) 6.764)
    (= (y g) 0.852)
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
