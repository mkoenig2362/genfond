(define (problem p01-5)
  (:domain delivery)

  (:objects p1 - package g - gripper t - target)

  (:init
    (= (x p1) 6.075)
    (= (y p1) 6.350)
    (= (x t) 0.000)
    (= (y t) 0.000)
    (= (x g) 3.289)
    (= (y g) 6.038)
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
