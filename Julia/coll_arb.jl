# CSC 330
# Assignmant 3 - Collatz Conjecture
#
# Author: Devin McBryde
#
#
#

#stores the top ten highest values and the steps to 1
maxValues = zeros(Int64, 2, 10)

#the location of the minimum value in the array
minVal = 1

#recursive function that return the number of steps needed to return
#	to one for the input number
function collatzStep(a::Int64)::Int64

	#if convert(Bool,(a & 1))
	if a%2 == 1
		a = a*3 + 1
	else
		a = a>>1
	end

	return a

end 

#maxValues[1,4] = 1

i = parse(BigInt,"1000000000000000")

#Main loop that goes through all values between 2 and 5000000000
#	Top value has the L suffix since literals are interpreted as integers
while i > 999999999000000

	alreadyexists = 0

	#reset the next twp values for the new number
	#col holds the value of the iterated number
	col::Int64 = i
	#stepCount tracks the number of iterations total	
	stepCount::Int64 = 0

	#Here we iterate values until they hit 1
	while col != 1

		#next two lines use the function, however the program then
		#	runs much slower

		#stepCount += 1
		#col = collatzStep(col)

		#This if statement will perform the operations the collatz sequence

		if col%2 == 1

			#If the number is odd the next number must be even
			#	therefore we can avoid logic checks by 
			#	performing both operations and adding 2
			#	to the count
			col = (col*3 + 1)>>1
			stepCount += 2
		else
			#If the number is even we divide by two and add one to count
			col = col>>1
			stepCount += 1
		end

	end

	#Here we avoid having a value with a duplicate number of steps using the boolean flag
	for j = 1:10
		#We check if our count has been recorded already
		if stepCount == maxValues[1,j]
			alreadyexists = 1
		end
	end

	#Here we check if the count is larger than the smallest count recorded and add if it is
	if stepCount > maxValues[1,minVal] && !(alreadyexists == 1)

		#here we replace the value of the smallest count
		for j = 1:10

			if j == minVal 

				maxValues[1,j] = stepCount
				maxValues[2,j] = i

			end

		end

		#we now reset the minVal to look for the new lowest count value

		minVal = 1

		#search for the smallest count size in maxValues
		for j = 1:10

			if maxValues[1,j] < maxValues[1,minVal]
				minVal = j
			end

		end

	end

	i = i - 1

end

#Now we perform a basic selection sort on the step count before printing
for i = 1:9

	minValue::Int64 = maxValues[1,i]
	minColNum::Int64  = maxValues[2,i]
	minLocale = i
	
	for j = (i+1):10
	
		if minValue < maxValues[1,j]
			minValue = maxValues[1,j]
			minColNum = maxValues[2,j]
			minLocale = j
		end
	
	end
	
	tempVal::Int64  = maxValues[1,i]
	tempNum::Int64  = maxValues[2,i]
	
	maxValues[1,i] = minValue
	maxValues[1,minLocale] = tempVal

	maxValues[2,i] = minColNum
	maxValues[2,minLocale] = tempNum
	
end

#print the maxValues array
for i = 1:10
	println("Values: ", maxValues[2,i]," Steps Taken: ", maxValues[1,i])
end

