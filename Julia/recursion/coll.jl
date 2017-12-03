col = 0
stepCount = 0

maxValues = zeros(Int64, 2, 10)
minVal = 1

function collatzStep(a)

	counter = 0
	
	if a == 1
		return 0
	elseif a % 2 == 1
		counter += collatzStep(a*3 + 1)
	else
		counter += collatzStep(a/2)
	end

	counter = counter + 1

	return counter

end 

maxValues[1,4] = 1

for i = 2:1000


	col = i
	stepCount = 0

	stepCount = collatzStep(col)


	if stepCount > maxValues[1,minVal]

		for j = 1:10

			if j == minVal 

				maxValues[1,j] = stepCount
				maxValues[2,j] = i

			end

		end

		minVal = 1

		for j = 1:10

			if maxValues[1,j] < maxValues[1,minVal]
				minVal = j
			end

		end

	end

end

for i = 1:10
	println("Values: ", maxValues[2,i]," Steps Taken: ", maxValues[1,i])
end
