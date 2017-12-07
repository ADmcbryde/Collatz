# CSC330
# Assignment 3 - Collatz Conjecture
#
# Author: Devin McBryde
#
#
#

maxValues = [[0 for x in range(2)]for y in range(10)]
minVal = 0

def collatzStep(a):

	counter = 0

	if (a == 1):
		return counter
	elif ( (a%2) == 1) :
		counter = collatzStep(a*3+1)
	else:
		counter = collatzStep(a/2)

	counter = counter + 1
	return counter

#for x in range(10):
	#print maxValues[x][0]


for x in range(2, 10000):
	col = x
	count = 0

	#while(col != 1):
		
	#	count += 1
		#col = collatzStep(col)
	#	if ( (col%2) == 1) :
	#		col = col*3+1
	#	else:
	#		col = col/2

		#return a
		
	count = collatzStep(col)

	if (count > maxValues[minVal][0]):

		for y in range(10):
			if(y == minVal):
				maxValues[y][0] = count
				maxValues[y][1] = x
		minVal = 0
		for y in range(10):
			if(maxValues[y][0] < maxValues[minVal][0]):
				minVal = y

for i in range(10):
	print "Value: " , maxValues[i][1] , " Steps Taken: " , maxValues[i][0]


