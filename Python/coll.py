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


	if ( (a%2) == 1) :
		a = a*3+1
	else:
		a = a/2

	return a

#for x in range(10):
	#print maxValues[x][0]


for x in range(2, 1000):
	col = x
	count = 0

	while(col != 1):
		
		count += 1
		col = collatzStep(col)

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


