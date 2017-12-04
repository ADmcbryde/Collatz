#!/usr/bin/sbcl --script
; CSC330
; Assignment 3 - Collatz Conjecture
;
; Author: Devin McBryde
;
;
;

(defun collatzStep (input)
	(defvar counter)
	(setf counter 0)

	(if (= input 1)
		(return-from collatzStep 0)
		(if (= (mod input 2) 1)
			(setf counter (collatzStep (+ (* input 3) 1) ) )
			(setf counter (collatzStep (/ input 2)  ) )
		)
	)

	(setf counter (+ counter 1))
	(return-from collatzStep counter)

)

(defvar maxValues)
(setf maxValues(make-array (list 2 10)))

(defvar minVal 0)
(defvar col 0)
(defvar stepCount 0)

(dotimes (i 10)
	(setf (aref maxValues 0 i) 0)
)

(loop for i from 2 to 1000
    do 

	(setf col i)
	(setf stepCount 0)

	;while loop
	(setf stepCount (collatzStep col))

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