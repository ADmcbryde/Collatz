with Ada.Text_IO;
with Ada.Long_Integer_Text_IO;

use Ada.Text_IO;

procedure coll is
	--stores the top ten highest values and the steps to 1
	maxValues	:array(1..2, 1..10) of Long_Integer;
	--the location of the minimum value in the array
	minValue	:Integer;

	--col holds the value of the iterated number
	col		:Long_Integer;
	--count tracks the number of iterations total
	stepCount	:Long_Integer;

	alreadyexists	:Integer;

	--These are needed for the selection sort

	minValueNum	:Long_Integer;
	minColNum	:Long_Integer;
	minLocale	:Integer;
	tempVal		:Long_Integer;
	tempNum		:Long_Integer;

begin
	--Initialize the Array to zero values
	for i in 1..10 loop
		maxValues(1,i) := 0;
	end loop;

	for i in 1..10 loop
		maxValues(2,i) := 0;
	end loop;


	minValue := 1;

	for i in Long_Integer(1)..Long_Integer(1000000) loop

		alreadyexists := 0;

		--reset the next two values for the new number

		--col holds the value of the iterated number
		col := i;
		--count tracks the number of iterations total
		stepCount := 0;

		--Here we iterate values until they hit 1
		while col /= 1 loop

			--This if statement will perform the operations the collatz sequence
			if col mod 2 = 1 then
				--If the number is odd the next number must be even
					--	therefore we can avoid logic checks by 
					--	performing both operations and adding 2
					--	to the count
				col := (col * 3 + 1)/2;
				stepCount := stepCount + 2;
			else
				--If the number is even we divide by two and add one to count
				col := col / 2;
				stepCount := stepCount + 1;
			end if;

		end loop;

		--Here we avoid having a value with a duplicate number of steps using the boolean flag
		for j in 1..10 loop
			if stepCount = maxValues(1,j) then
				--We check if our count has been recorded already
				alreadyexists := 1;
			end if;
		end loop;

		if stepCount > maxValues(1,minValue) and alreadyexists /= 1 then

			--here we replace the value of the smallest count
			for j in 1..10 loop

				if j = minValue then
					maxValues(1,j) := stepCount;
					maxValues(2,j) := i;
				end if;

			end loop;

			--we now reset the minVal to look for the new lowest count value
			minValue := 1;

			--search for the smallest count size in maxValues
			for j in 1..10 loop

				if maxValues(1,j) < maxValues(1,minValue) then
					minValue := j;
				end if;

			end loop;

		end if;

	end loop;

	--Now we perform a basic selection sort on the step count before printing
	for i in 1..9 loop

		minValueNum := maxValues(1,i);
		minColNum := maxValues(2,i);
		minLocale := i;
	
		for j in (i+1)..10 loop
	
			if minValueNum < maxValues(1,j) then
				minValueNum := maxValues(1,j);
				minColNum := maxValues(2,j);
				minLocale := j;
			end if;
	
		end loop;
	
		tempVal := maxValues(1,i);
		tempNum := maxValues(2,i);
	
		maxValues(1,i) := minValueNum;
		maxValues(1,minLocale) := tempVal;
	
		maxValues(2,i) := minColNum;
		maxValues(2,minLocale) := tempNum;
	
	end loop;

	--print the maxValues array
	for i in 1..10 loop
		Ada.Text_IO.Put("Values:");
		Ada.Long_Integer_Text_IO.Put(maxValues(2,i));
		Ada.Text_IO.Put(" Steps Taken:");
		Ada.Long_Integer_Text_IO.Put(maxValues(1,i));
		Ada.Text_IO.Put_Line("");
	end loop;


end coll;

