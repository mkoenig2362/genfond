(define (problem instance_5)
	(:domain sailing)
	(:objects
		B1 - boat
		P1 P2 P3 P4 P5 - person
	)
    (:init (= (x B1) 0) 
			(= (x P1) 2) (= (x P2) 5)  (= (x P3) 2)
			(= (x P4) 0) (= (x P5) 1)
			(is_b B1) 
			(is_p P1) (is_p P2) (is_p P3) (saved B1)
			(is_p P4) (is_p P5))
    (:goal (and (saved P1) (saved P2) (saved P3)
			 (saved P4) (saved P5)))
)