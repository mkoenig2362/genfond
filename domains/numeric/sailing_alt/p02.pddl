(define (problem instance_2)
	(:domain sailing)
	(:objects
		B1  - boat
		P1  - person
	)
    (:init (= (x B1) 0) (= (y B1) 0) (= (x P1) 0) (= (y P1) 0) 
			(is_b B1) (is_p P1))
    (:goal (and (saved P1)))
)