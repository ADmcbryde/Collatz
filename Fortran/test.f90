program test

	real :: a, area
	a = area(2.0)

	print *, a

end program test

real function area (r)

	implicit none

	real :: r, pi

	pi = 4 * 1
	area = pi * r

end function area
