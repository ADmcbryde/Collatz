# CSC330
# Assignment 3 - Collatz Conjecture
#
# Author: Devin McBryde
#
#
#

#maxValues = [[0 for x in range(2)]for y in range(10)]
#minVal = 0

def collatzStep(a):


	if ( (a%2) == 1) :
		a = a*3+1
	else:
		a = a/2

	return a

#for x in range(10):
	#print maxValues[x][0]
def collatz():

	maxValues = [[0 for x in range(2)]for y in range(10)]
	minVal = 0

	col = long(0)
	
	x = 2

	while(x < 1000000):
	
		col = x
		count = 0

		#if (x % 100000 == 0):
		#	print x
	
		while(col > 1):
			
			#count += 1
			#col = collatzStep(col)
			if ( (col&1) ) :
				col = (col*3+1)>>1
				count += 2
			else:
				col = col>>1
			        count += 1

			#col = ((col*3+1)>>1) if (col&1) else (col>>1)
	

		if (count > maxValues[minVal][0]):
	
			for y in range(10):
				if(y == minVal):
					maxValues[y][0] = count
					maxValues[y][1] = x
			minVal = 0
			for y in range(10):
				if(maxValues[y][0] < maxValues[minVal][0]):
					minVal = y
		x += 1	

	for i in range(10):
		print "Value: " , maxValues[i][1] , " Steps Taken: " , maxValues[i][0]
	
collatz()	
