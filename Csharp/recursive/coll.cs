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
	
			//col holds the value of the iterated number
			long col = i;
			//count tracks the number of iterations total
			long count = 0;

			//Here we iterate values until they hit 1
			count = collatzStep(col);
			
			if(count > maxValues[0,minVal]){
				
				for(int j = 0; j < 10; j++){
					 
					if (j == minVal){
						maxValues[0,j] = count;
						maxValues[1,j] = i;
					}
				}
				minVal = 0;
				
				for(int j = 0; j < 10; j++){
					if (maxValues[0,j] < maxValues[0,minVal]){
						minVal = j;
					}
				}

			}
			
	
		}
	
		for(int i = 0; i < 10; i++){
	
			Console.WriteLine("Value: " + maxValues[1,i] + " Steps Taken: " + maxValues[0,i]);
	
		}

	}

	private static int collatzStep(long input){

		int stepCount = 0;

		if(input == 1){
			return 0;
		}else if(input%2 == 1){
			stepCount += collatzStep(input*3+1);
		}else{
			stepCount += collatzStep(input/2);
		}
	
		stepCount += 1;
		return stepCount;
	
	}
}
