(define (problem instance_3)
	(:domain sailing)
	(:objects
		B1 - boat
		P1 P2  - person
	)
    (:init (= (x B1) 0) (= (y B1) 2) (= (x P1) 2) (= (y P1) 5) (= (x P1) 4) (= (y P1) 7) 
			(is_b B1) (is_p P1) (is_p P2))
    (:goal (and (saved P1) (saved P2)))
)