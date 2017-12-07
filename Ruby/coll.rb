#/usr/bin/env ruby

maxValues = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]]

minVal = 0

def collatzStep!(input)

	if input%2 == 1
		input = input *3 + 1
	else
		input = input/2
	end

	return input

end


for i in 2..1000000

	col = i
	count = 0

	while col != 1 do

		#count += 1

		#col = collatzStep!(col)

		if col&1 == 1
			col = (col*3 + 1)>>1
			#col = col/2
			count+=2
		else
			col = col>>1
			count+=1
		end

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
	print "Values: ", maxValues[1][i], " Steps Taken: ", maxValues[0][i], "\n"
end
