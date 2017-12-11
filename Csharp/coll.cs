/* CSC 330
 * Assignmant 3 - Collatz Conjecture
 *
 * Author: Devin McBryde
 *
 *
 */
using System;

public class Coll{

	static public void Main(String[] args){	

		//stores the top ten highest values and the steps to 1
		long[,] maxValues = new long[2,10];
	
		//the location of the minimum value in the array
		int minVal = 0;	

		//Main loop that goes through all values between 2 and 5000000000
		//	Top value has the L suffix since literals are interpreted as integers	
		for (long i = 2; i < 1000000; i++){

			bool alreadyexists = false;
	
			//reset the next two values for the new number
			//col holds the value of the iterated number
			long col = i;
			//count tracks the number of iterations total
			long count = 0;

			//Here we iterate values until they hit 1
			while(col != 1){
		
				//next two lines use the function, however the program then
				//	runs much slower
				//count += 1;
				//col = collatzStep(col);
				
				//This if statement will perform the operations	

				if((col&1) == 1){

					//If the number is odd the next number must be even
					//	therefore we can avoid logic checks by 
					//	performing both operations and adding 2
					//	to the count
					col = (col*3 +1)/2;
					count += 2;
				}else{
					//If the number is even we divide by two and add one to count
					col = col/2;
					count += 1;
				}
		
			}	

			//Here we avoid having a value with a duplicate number of steps using the boolean flag
			for(int j = 0; j < 10; j++){
				//We check if our count has been recorded already
				if (count == maxValues[0,j]){
					alreadyexists = true;
				}
			}

			//Here we check if the count is larger than the smallest count recorded and add if it is
			if(count > maxValues[0,minVal] && !alreadyexists){ 
				
				//here we replace the value of the smallest count
				for(int j = 0; j < 10; j++){
					 
					if (j == minVal){
						maxValues[0,j] = count;
						maxValues[1,j] = i;
					}
				}
				//we now reset the minVal to look for the new lowest count value
				minVal = 0;
				
				//search for the smallest count size in maxValues
				for(int j = 0; j < 10; j++){
					if (maxValues[0,j] < maxValues[0,minVal]){
						minVal = j;
					}
				}

			}
			
	
		}
	
		//Now we perform a basic selection sort on the step count before printing
		for(int i = 0; i < 9; i++){

			long minValue = maxValues[0,i];
			long minColNum = maxValues[1,i];
			int minLocale = i;
	
			for(int j = i+1; j < 10; j++){
	
				if(minValue < maxValues[0,j]){
					minValue = maxValues[0,j];
					minColNum = maxValues[1,j];
					minLocale = j;
				}
	
			}
	
			long tempVal = maxValues[0,i];
			long tempNum = maxValues[1,i];
	
			maxValues[0,i] = minValue;
			maxValues[0,minLocale] = tempVal;
	
			maxValues[1,i] = minColNum;
			maxValues[1,minLocale] = tempNum;
	
		}

		//print the maxValues array
		for(int i = 0; i < 10; i++){
	
			Console.WriteLine("Value: " + maxValues[1,i] + " Steps Taken: " + maxValues[0,i]);
	
		}

	}

	private static long collatzStep(long input){
	
		if(input%2 == 1){
			input = input*3 +1;
			}else{
			input = input/2;
		}
	
		return input;
	
	}
}
