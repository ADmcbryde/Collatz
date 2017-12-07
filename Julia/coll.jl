maxValues = zeros(Int64, 2, 10)
minVal = 1

function collatzStep(a::Int64)::Int64

	b = 123 & 234

	#if convert(Bool,(a & 1))
	if a%2 == 1
		a = a*3 + 1
	else
		a = a>>1
	end

	return a

end 

maxValues[1,4] = 1

for i::Int64 = 2:1000000


	col::Int64 = i
	stepCount::Int64 = 0

	#if i % 100000 == 0
		#println(i)
	#end

	while col != 1

		#stepCount += 1

		if col%2 == 1
			col = (col*3 + 1)>>1
			stepCount += 2
		else
			col = col>>1
			stepCount += 1
		end

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
