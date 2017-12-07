! CSC 330
! Assignmant 3 - Collatz Conjecture
!
! Author: Devin McBryde
!
!
!
program coll

	implicit none

	integer(kind=16), dimension(2,10) :: maxValues
	integer(kind=8) :: minValue
	integer(kind=16) :: col
	integer(kind=16) :: stepCount
	integer(kind=8) :: valRange
	integer(kind=16) :: collatzStep

	integer(kind=8) :: i, j, k

	integer(kind=16) :: finish

	do i = 1, 10

	finish = 1000000000
	finish = finish * 5

		maxValues(1,i) = 0
		maxValues(2,i) = 0

	end do

	minValue = 1

	valRange = 10

	!print *, collatzStep(valRange)

	do i = 2, 1000

		col = i
		stepCount = 0

!		do while (col .ne. 1)
!			
!			stepCount = stepCount + 1
!			col = collatzStep(col)
!			!print *, col
!
!		end do

		stepCount = collatzStep(col);

		!print *, i

		if (stepCount > maxValues(1,minValue) ) then
		

			do j = 1, 10
			
				if (j .eq. minValue) then
					maxValues(1,j) = stepCount
					maxValues(2,j) = i
				end if
			end do
			minValue = 1

			do j = 1, 10
				if (maxValues(1,j) < maxValues(1,minValue)) then
					minValue = j
				end if
			end do

		end if
	end do

	do i = 1, 10
		print *, "Values:", maxValues(2,i), " Steps Taken:", maxValues(1,i)
	end do


end program coll

recursive integer(kind=16) function collatzStep(input) result(counter)

	!integer(kind=8) :: counter

	if (input .eq. 1) then
		!collatzStep = 0
		counter = 0
	else if (MOD(input,2) .eq. 1) then
		counter = collatzStep(input*3+1)
		counter = counter + 1 
		!collatzStep = counter
	else 
		counter = collatzStep(input / 2)
		counter = counter + 1 
		!collatzStep = counter
	end if


end function collatzStep
