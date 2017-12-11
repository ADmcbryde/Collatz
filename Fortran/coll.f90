! CSC 330
! Assignmant 3 - Collatz Conjecture
!
! Author: Devin McBryde
!
!
!
program coll

	!suppresses some old aspects of fortran that can break code
	implicit none

	!stores the top ten highest values and the steps to 1
	integer(kind=16), dimension(2,10) :: maxValues

	!the location of the minimum value in the array
	integer(kind=8) :: minValue

	!col holds the value of the iterated number
	integer(kind=16) :: col

	!count tracks the number of iterations total
	integer(kind=8) :: stepCount
	integer(kind=8) :: valRange

	!this is for the collatzStep function and determines the return type
	integer(kind=16) :: collatzStep

	!To optimize the collatz math I use this value with a bitwise AND
	!	to determine if col is odd or even
        integer(kind=16) :: test

	!some values to use for iterating through some loops
	integer(kind=16) :: i, j, k

	!To avoid an issue with defining the size of the array to 5 billion
	!	I assign the array a value then some math puts it at the value
	integer(kind=16) :: finish

	logical		:: alreadyexists

	integer(kind=16) :: minValueNum
	integer(kind=16) :: minColNum
	integer(kind=16) :: tempVal
	integer(kind=16) :: tempNum
	integer(kind=8)	::  minLocale

	!we need to make test one for the bitwise to work
        test = 1

	!here we initialize maxValues to zeroes
	do i = 1, 10

	finish = 1000000
	!finish = finish * 5

		maxValues(1,i) = 0
		maxValues(2,i) = 0

	end do

	minValue = 1

	!used later for some if statements
	valRange = 10

	!this loop runs until finish, this is due to the inability of hardcoding
	!	The high value if it is too large
	do i = 2, finish

		alreadyexists = .false.

		!reset the next two values for the new number
		col = i
		stepCount = 0

		!Here we iterate values until they hit 1
		do while (col .ne. 1)
			!next two lines use the function, however the program then
			!	runs much slower

			!stepCount = stepCount + 1
			!col = collatzStep(col)

			!This if statement will perform the operations the collatz sequence
                        if (IAND(col,test) .eq. 1) then
				!If the number is odd the next number must be even
				!	therefore we can avoid logic checks by 
				!	performing both operations and adding 2
				!	to the count        
	                        col = ((col*3)+1)/2
				stepCount = stepCount + 2
			else
				!If the number is even we divide by two and add one to count
				col = col / 2
				stepCount = stepCount + 1
			end if


		end do

		!Here we avoid having a value with a duplicate number of steps using the boolean flag
		do j = 1, 10
			if (stepCount .eq. maxValues(1,j)) then
				alreadyexists = .true.
			end if
		end do

		if (stepCount > maxValues(1,minValue) .and. (.not. alreadyexists)) then
		
			!here we replace the value of the smallest count
			do j = 1, 10
			
				if (j .eq. minValue) then
					maxValues(1,j) = stepCount
					maxValues(2,j) = i
				end if
			end do
			!we now reset the minVal to look for the new lowest count value
			minValue = 1

			!search for the smallest count size in maxValues
			do j = 1, 10
				if (maxValues(1,j) < maxValues(1,minValue)) then
					minValue = j
				end if
			end do

		end if
	end do

	!Now we perform a basic selection sort on the step count before printing
	do i = 1, 9

		minValueNum = maxValues(1,i)
		minColNum = maxValues(2,i)
		minLocale = i

		do j = (i+1),10
			if (minValueNum < maxValues(1,j)) then
				minValueNum = maxValues(1,j)
				minColNum = maxValues(2,j)
				minLocale = j
			end if
		end do

		tempVal = maxValues(1,i)
		tempNum = maxValues(2,i)

		maxValues(1,i) = minValueNum
		maxValues(1,minLocale) = tempVal

		maxValues(2,i) = minColNum
		maxValues(2,minLocale) = tempNum

	end do

	!print the maxValues array
	do i = 1, 10
		print *, "Values:", maxValues(2,i), " Steps Taken:", maxValues(1,i)
	end do


end program coll

!Function that will perform a collatz step
integer(kind=16) function collatzStep(input)

	integer(kind=16) :: input

	if (MOD(input,2) .eq. 1) then
		input = input*3+1
	else
		input = input / 2
	end if

	collatzStep = input

end function collatzStep
