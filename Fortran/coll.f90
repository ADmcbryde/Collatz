! CSC 330
! Assignmant 3 - Collatz Conjecture
!
! Author: Devin McBryde
!
!
!
program coll

	implicit none

	integer(kind=8), dimension(2,10) :: maxValues
	integer(kind=8) :: minValue
	integer(kind=8) :: col
	integer(kind=8) :: stepCount
	integer(kind=8) :: valRange
	integer(kind=8) :: collatzStep

	integer(kind=8) :: i, j, k

	do i = 1, 10

		maxValues(1,i) = 0
		maxValues(2,i) = 0

	end do

	minValue = 1

	valRange = 10

	!print *, collatzStep(valRange)

	do i = 2, 1000

		col = i
		stepCount = 0

		do while (col .ne. 1)
			
			stepCount = stepCount + 1
			col = collatzStep(col)
			!print *, col




		end do

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
		print *, "Values", maxValues(1,i), " num", maxValues(2,i)
	end do


end program coll

integer(kind=8) function collatzStep(input)

	integer(kind=8) :: input

	if (MOD(input,2) .eq. 1) then
		input = input*3+1
	else
		input = input / 2
	end if

	collatzStep = input

end function collatzStep
