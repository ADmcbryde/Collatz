#/usr/bin/env ruby

maxValues = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]

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


for i in 4999990000..5000000000

	col = i
	count = 0

	count = collatzStep col
		
	if count > maxValues[0][minVal]

		for j in 0..9

			if j == minVal
			
				maxValues[0][j] = count
				maxValues[1][j] = i
			
			end

		end

		minval = 0

		for j in 0..9
			if maxValues[0][j] < maxValues[0][minVal]

				minVal = j

			end

		end
	end

end

for i in 0..9
	print "Values: ", maxValues[1][i], " Steps Taken: ", maxValues[0][i], "\n"
end
