#/usr/bin/env ruby

#stores the top ten highest values and the steps to 1
#	and initializes the array to zeroes
maxValues = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]

#stores the top ten highest values and the steps to 1
minVal = 0

def collatzStep (input)

	counter = 0
	if input == 1
		return 0
	elsif input%2 == 1
		counter += collatzStep(input *3 + 1)
	else
		counter += collatzStep(input/2)
	end

	counter = counter + 1

	return counter

end


for i in 2..1000000

	alreadyexists = false

	#reset the next two values for the new number
	#col holds the value of the iterated number
	col = i

	#count tracks the number of iterations total
	count = 0

	count = collatzStep col
		
	#Here we avoid having a value with a duplicate number of steps using the boolean flag
	for j in 0..9
		if count == maxValues[0][j]
			alreadyexists = true
		end
	end

	#Here we check if the count is larger than the smallest count recorded and add if it is
	if count > maxValues[0][minVal] and !alreadyexists

		#here we replace the value of the smallest count
		for j in 0..9

			if j == minVal
			
				maxValues[0][j] = count
				maxValues[1][j] = i
			
			end

		end

		#we now reset the minVal to look for the new lowest count value
		minval = 0

		#search for the smallest count size in maxValues
		for j in 0..9
			if maxValues[0][j] < maxValues[0][minVal]

				minVal = j

			end

		end
	end

end

#Now we perform a basic selection sort on the step count before printing
for i in 0..8

	minValue = maxValues[0][i]
	minColNum  = maxValues[1][i]
	minLocale = i
	
	for j in (i+1)..9
	
		if minValue < maxValues[0][j]
			minValue = maxValues[0][j]
			minColNum = maxValues[1][j]
			minLocale = j
		end
	
	end
	
	tempVal = maxValues[0][i]
	tempNum = maxValues[1][i]
	
	maxValues[0][i] = minValue
	maxValues[0][minLocale] = tempVal

	maxValues[1][i] = minColNum
	maxValues[1][minLocale] = tempNum
	
end

#print the maxValues array
for i in 0..9
	print "Values: ", maxValues[1][i], " Steps Taken: ", maxValues[0][i], "\n"
end
