# CSC330
# Assignment 3 - Collatz Conjecture
#
# Author: Devin McBryde
#
#
#

def collatzStep(a):


	if ( (a%2) == 1) :
		a = a*3+1
	else:
		a = a/2

	return a

#The program is programmed as a function since local references are faster
#	than global variable references and speeds up the inner while loop
def collatz():

	#stores the top ten highest values and the steps to 1
	#	and initializes the array to zeroes
	maxValues = [[0 for x in range(2)]for y in range(10)]
	
	#stores the top ten highest values and the steps to 1
	minVal = 0

	col = long(0)
	
	#initialize x for the loop
	x = 1000000000000000

	#Main loop that goes through all values between 2 and 5000000000
	#	Top value has the L suffix since literals are interpreted as integers
	#	This is a while loop instead since range(x) would produce an 
	#	array that would take over 20-40 gigabytes to store, depending
	#	on if the array would store 4 or 8 byte integers. This can
	#	also be solved by using xrange() instead, which uses iterators
	#	instead, but its behavior is less well understood
	while(x > 1):
	
		alreadyexists = False

		#reset the next two values for the new number
		#col holds the value of the iterated number
		col = x

		#count tracks the number of iterations total
		count = 0
	
		#Here we iterate values until they hit 1
		while(col != 1):
			
			#next two lines use the function, however the program then
			#	runs much slower

			#count += 1
			#col = collatzStep(col)

			#This if statement will perform the operations the collatz sequence

			if ( (col&1) ) :

				#If the number is odd the next number must be even
				#	therefore we can avoid logic checks by 
				#	performing both operations and adding 2
				#	to the count
				col = (col*3+1)/2
				count += 2
			else:
				#If the number is even we divide by two and add one to count
				col = col/2
			        count += 1

			#col = ((col*3+1)>>1) if (col&1) else (col>>1)
	
		#Here we avoid having a value with a duplicate number of steps using the boolean flag
		for z in range(10):
			if (count == maxValues[z][0]):
				alreadyexists = True

		#Here we check if the count is larger than the smallest count recorded and add if it is
		if (count > maxValues[minVal][0] and not(alreadyexists)):

			#here we replace the value of the smallest count
			for y in range(10):
				if(y == minVal):
					maxValues[y][0] = count
					maxValues[y][1] = x

			#we now reset the minVal to look for the new lowest count value
			minVal = 0

			#search for the smallest count size in maxValues
			for y in range(10):
				if(maxValues[y][0] < maxValues[minVal][0]):
					minVal = y
		#increment x for the while loop to go to the next		
		x -= 1	


	#Now we perform a basic selection sort on the step count before printing
	for i in range(0,9):

		minValue = maxValues[i][0];
		minColNum = maxValues[i][1];
		minLocale = i;
	
		for j in range(i+1,10):
	
			if(minValue < maxValues[j][0]):
				minValue = maxValues[j][0];
				minColNum = maxValues[j][1];
				minLocale = j;
			
	
		
	
		tempVal = maxValues[i][0];
		tempNum = maxValues[i][1];
	
		maxValues[i][0] = minValue;
		maxValues[minLocale][0] = tempVal;
	
		maxValues[i][1] = minColNum;
		maxValues[minLocale][1] = tempNum;
	
	

	#print the maxValues array
	for i in range(10):
		print "Value: " , maxValues[i][1] , " Steps Taken: " , maxValues[i][0]
	
collatz()	
