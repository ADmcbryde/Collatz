#!/usr/bin/sbcl --script
; CSC330
; Assignment 3 - Collatz Conjecture
;
; Author: Devin McBryde
;
;
;

(defvar maxValues)
(setf maxValues(make-array (list 2 10)))

(defvar minVal 0)
(defvar col 0)
(defvar stepCount 0)

(dotimes (i 10)
	(setf (aref maxValues 0 i) 0)
)

(loop for i from 2 to 100000000
    do 

	(setf col i)
	(setf stepCount 0)

	;while loop
	(loop

		(setf stepCount (+ stepCount 1))

		(if (= (mod col 2) 1)
			(setf col (+ (* col 3) 1))
			(setf col (/ col 2))
		)

		(when (= col 1) (return 0))

		;(format t "~w" col)

	)

	;if
	(if (> stepCount (aref maxValues 0 minVal))
		(progn
			;for loop
			(dotimes (j 10)
				;if
				(if (= j minVal)
					(progn
						(setf (aref maxValues 0 j) stepCount)
						(setf (aref maxValues 1 j) i)
					)
				)
			)

			(setf minVal 0)

			;for loop
			(dotimes (j 10)
				;if
				(if (< (aref maxValues 0 j) (aref maxValues 0 minVal))
					(setf minVal j)
				)			
			)
		)
	)
    
)
(dotimes (i 10)
	(format t "Values: ~w " (aref maxvalues 1 i))
	(format t "Steps Taken: ~w" (aref maxvalues 0 i))
	(terpri)
)
