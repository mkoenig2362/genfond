(define (problem instance_1)
	(:domain sailing)
	(:objects
		B1  - boat
		P1  - person
	)
    (:init (= (x B1) 0) (= (y B1) 2) (= (x P1) 2) (= (y P1) 5) 
			(is_b B1) (is_p P1))
    (:goal (and (saved P1)))
)