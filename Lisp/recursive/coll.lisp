#!/usr/bin/sbcl --script
; CSC330
; Assignment 3 - Collatz Conjecture
;
; Author: Devin McBryde
;
;
;

;recursive function that return the number of steps needed to return
;	to one for the input number
(defvar counter)
(defun collatzStep (input)
	;(defvar counter)
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

;stores the top ten highest values and the steps to 1
(defvar maxValues)
(setf maxValues(make-array (list 2 10)))

;the location of the minimum value in the array
(defvar minVal 0)

;col holds the value of the iterated number
(defvar col 0)

;stepCount tracks the number of iterations total
(defvar stepCount 0)

(defvar alreadyexists nil)

(defvar minValueNum 0)
(defvar minColNum 0)
(defvar minLocale 0)
(defvar tempVal 0)
(defvar tempNum 0)

;initialize the array to zeroes
(dotimes (i 10)
	(setf (aref maxValues 0 i) 0)
)

;Main loop that goes through all values between 2 and 5000000000
;	Top value has the L suffix since literals are interpreted as integers
(loop for i from 2 to 1000000
    do 
	
	(setf alreadyexists nil)

	;reset the next two values for the new number
	(setf col i)
	(setf stepCount 0)

	;stepCount is given the number of steps for the given value to collatzStep to return to one
	(setf stepCount (collatzStep col))

	;Here we avoid having a value with a duplicate number of steps using the boolean flag
	(dotimes (j 10)
		(if (eq stepCount (aref maxValues 0 j))
			(setf alreadyexists t)
		)
	)

	;Here we check if the count is larger than the smallest count recorded and add if it is
	(if (and (> stepCount (aref maxValues 0 minVal)) (eq alreadyexists nil) )
		(progn
			;here we replace the value of the smallest count
			(dotimes (j 10)
				;if
				(if (= j minVal)
					(progn
						(setf (aref maxValues 0 j) stepCount)
						(setf (aref maxValues 1 j) i)
					)
				)
			)

			;we now reset the minVal to look for the new lowest count value
			(setf minVal 0)

			;search for the smallest count size in maxValues
			(dotimes (j 10)
				;if
				(if (< (aref maxValues 0 j) (aref maxValues 0 minVal))
					(setf minVal j)
				)			
			)
		)
	)
    
)

;Now we perform a basic selection sort on the step count before printing
(dotimes (i 9)

	(setf minValueNum (aref maxValues 0 i))
	(setf minColNum (aref maxValues 1 i))
	(setf minLocale i)

	(loop for j from i to 9 do
		(if (< minValueNum (aref maxValues 0 j))
			(progn
				(setf minValueNum (aref maxValues 0 j))
				(setf minColNum (aref maxValues 1 j))
				(setf minLocale j)
			)
		)
	)

	(setf tempVal (aref maxValues 0 i))
	(setf tempNum (aref maxValues 1 i))

	(setf (aref maxValues 0 i) minValueNum)
	(setf (aref maxValues 0 minLocale) tempVal)

	(setf (aref maxValues 1 i) minColNum)
	(setf (aref maxValues 1 minLocale) tempNum)

)

;print the maxValues array
(dotimes (i 10)
	(format t "Values: ~w " (aref maxvalues 1 i))
	(format t "Steps Taken: ~w" (aref maxvalues 0 i))
	(terpri)
)
