(define (problem instance_4)
	(:domain sailing)
	(:objects
		B1 B2 - boat
		P1 P2 P3  - person
	)
    (:init (= (x B1) 0) (= (y B1) 2) (= (x B2) 10) (= (y B2) 10) 
			(= (x P1) 2) (= (x P2) 5) (= (x P3) 7)
			(= (y P1) 2) (= (y P2) 5) (= (y P3) 7)
			(is_b B1) (is_b B2) 
			(is_p P1) (is_p P2)  (is_p P3))
    (:goal (and (saved P1) (saved P2) (saved P3)))
)