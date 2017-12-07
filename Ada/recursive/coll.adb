with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Long_Integer_Text_IO;

use Ada.Text_IO;
--function collatzStep (input: Integer) return Integer is
--begin
--	if 1 = 1 then
--		return 0;
--	end if;
	

--end collatzStep;

procedure coll is

	maxValues	:array(1..2, 1..10) of Long_Integer;
	minValue	:Integer;

	col		:Long_Integer;
	stepCount	:Long_Integer;

	function collatzStep (input: Long_Integer) return Long_Integer is
		counter		:Long_Integer;

		begin		

		counter := 0;

		if input = 1 then
			return 0;
		elsif input mod 2 = 1 then
			counter := counter + collatzStep(input*3+1);
		else
			counter := counter + collatzStep(input/2);
		end if;
	
		counter := counter + 1;
		return counter;


	end collatzStep;

begin

	for i in 1..10 loop
		maxValues(1,i) := 0;
	end loop;

	for i in 1..10 loop
		maxValues(2,i) := 0;
	end loop;


	minValue := 1;

	for i in Long_Integer(1)..Long_Integer(1000) loop

		col := i;
		stepCount := 0;

		stepCount := collatzStep(col);
	
		if stepCount > maxValues(1,minValue) then

			for j in 1..10 loop

				if j = minValue then
					maxValues(1,j) := stepCount;
					maxValues(2,j) := i;
				end if;

			end loop;

			minValue := 1;

			for j in 1..10 loop

				if maxValues(1,j) < maxValues(1,minValue) then
					minValue := j;
				end if;

			end loop;

		end if;

	end loop;

	for i in 1..10 loop
		Ada.Text_IO.Put("Values:");
		Ada.Long_Integer_Text_IO.Put(maxValues(2,i));
		Ada.Text_IO.Put(" Steps Taken:");
		Ada.Long_Integer_Text_IO.Put(maxValues(1,i));
		Ada.Text_IO.Put_Line("");
	end loop;


end coll;

