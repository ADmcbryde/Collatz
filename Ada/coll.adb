with Ada.Text_IO;
with Ada.Long_Integer_Text_IO;

use Ada.Text_IO;
--function collatzStep (input: Integer) return Integer is
--begin
	
	

--end collatzStep;

procedure coll is

	maxValues	:array(1..2, 1..10) of Long_Integer;
	minValue	:Integer;

	col		:Long_Integer;
	stepCount	:Long_Integer;

begin

	for i in 1..10 loop
		maxValues(1,i) := 0;
	end loop;

	for i in 1..10 loop
		maxValues(2,i) := 0;
	end loop;


	minValue := 1;

	for i in Long_Integer(1)..Long_Integer(1000000) loop

		col := i;
		stepCount := 0;

		while col /= 1 loop

			if col mod 2 = 1 then
				col := (col * 3 + 1)/2;
				stepCount := stepCount + 2;
			else
				col := col / 2;
				stepCount := stepCount + 1;
			end if;

		end loop;

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
		Ada.Long_Integer_Text_IO.Put(maxValues(2,i));
		Ada.Long_Integer_Text_IO.Put(maxValues(1,i));
		Ada.Text_IO.Put_Line("");
	end loop;


end coll;

