#/usr/bin/env ruby

maxValues = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]

minVal = 0

def collatzStep (input)

	if input%2 == 1
		input = input *3 + 1
	else
		input = input/2
	end

	return input

end


for i in 2..1000

	col = i
	count = 0

	while col != 1 do

		count = count + 1
		col = collatzStep col

		

	end
		
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
	print "Values: ", maxValues[0][i], " Steps Taken: ", maxValues[1][i], "\n"
end
