(define (problem instance_2)
	(:domain sailing)
	(:objects
		B1 - boat
		P1 P2 P3 - person
	)
    (:init (= (x B1) 0) 
			(= (x P1) 2) (= (x P2) 5)  (= (x P3) 2)
			(is_b B1) 
			(is_p P1) (is_p P2) (is_p P3) )
    (:goal (and (saved P1) (saved P2) (saved P3) (saved B1)))
)