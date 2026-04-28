(define (problem instance_1)
	(:domain sailing)
	(:objects
		B1  - boat
		P1  - person
	)
    (:init (= (x B1) 3) (= (x P1) 0) (is_b B1) (is_p P1))
    (:goal (and (saved P1)))
)