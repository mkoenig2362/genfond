(define (problem instance_3)
	(:domain sailing)
	(:objects
		B1 - boat
		P1 P2  - person
	)
    (:init (= (x B1) 0) (= (x P1) 2) (= (x P2) 5)
			(is_b B1) (is_p P1) (is_p P2))
    (:goal (and (saved P1) (saved P2)))
)