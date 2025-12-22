(define (problem instance_5)
	(:domain sailing)
	(:objects
		B1 - boat
		P1 P2 P3 P4 P5 P6  - person
	)
    (:init (= (x B1) 0) (= (y B1) 0) 
			(= (x P1) 2) (= (x P2) 5)  (= (x P2) 20)
			(= (x P4) 0) (= (x P5) 1)  (= (x P6) 11)
			(= (y P1) 2) (= (y P2) 5)  (= (y P2) 20)
			(= (y P4) 0) (= (y P5) 1)  (= (y P6) 11)
			(is_b B1) 
			(is_p P1) (is_p P2) (is_p P3) 
			(is_p P4) (is_p P5) (is_p P6))
    (:goal (and (saved P1) (saved P2) (saved P3)
			 (saved P4) (saved P5) (saved P6)))
)