col = 0
stepCount = 0

maxValues = zeros(Int64, 2, 10)
minVal = 1

function collatzStep(a)

	if a % 2 == 1
		a = a*3 + 1
	else
		a = a/2
	end

	return a

end 

maxValues[1,4] = 1

for i = 2:1000


	col = i
	stepCount = 0

	while col != 1

		stepCount = stepCount + 1
		col = collatzStep(col)

	end

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
