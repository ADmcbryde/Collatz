/* CSC 330
 * Assignmant 3 - Collatz Conjecture
 *
 * Author: Devin McBryde
 *
 *
 */

public class Coll{

	public static void main(String[] args){	

		//stores the top ten highest values and the steps to 1
		long maxValues[][] = new long[2][10];
	
		//the location of the minimum value in the array
		int minVal = 0;	

		//Main loop that goes through all values between 2 and 5000000000
		//	Top value has the L suffix since literals are interpreted as integers	
		for (long i = 1L; i < 1000000L; i++){

			boolean alreadyexists = false;
	
			//reset the next two values for the new number
			//col holds the value of the iterated number
			long col = i;
			//count tracks the number of iterations total
			long count = 0;

			//count is given the number of steps for the given value to collatzStep to return to one		
			count = collatzStep(col);

			//Here we avoid having a value with a duplicate number of steps using the boolean flag
			for(int j = 0; j < 10; j++){
				//We check if our count has been recorded already
				if (count == maxValues[0][j]){
					alreadyexists = true;
				}
			}

			if(count > maxValues[0][minVal] && !alreadyexists){
				
				//here we replace the value of the smallest count
				for(int j = 0; j < 10; j++){
					 
					if (j == minVal){
						maxValues[0][j] = count;
						maxValues[1][j] = i;
					}
				}

				//we now reset the minVal to look for the new lowest count value
				minVal = 0;
				
				//search for the smallest count size in maxValues
				for(int j = 0; j < 10; j++){
					if (maxValues[0][j] < maxValues[0][minVal]){
						minVal = j;
					}
				}

			}
			
	
		}

		//Now we perform a basic selection sort on the step count before printing
		for(int i = 0; i < 9; i++){

			long minValue = maxValues[0][i];
			long minColNum = maxValues[1][i];
			int minLocale = i;
	
			for(int j = i+1; j < 10; j++){
	
				if(minValue < maxValues[0][j]){
					minValue = maxValues[0][j];
					minColNum = maxValues[1][j];
					minLocale = j;
				}
	
			}
	
			long tempVal = maxValues[0][i];
			long tempNum = maxValues[1][i];
	
			maxValues[0][i] = minValue;
			maxValues[0][minLocale] = tempVal;
	
			maxValues[1][i] = minColNum;
			maxValues[1][minLocale] = tempNum;
	
		}
	
		//print the maxValues array
		for(int i = 0; i < 10; i++){
	
			System.out.println("Value: " + maxValues[1][i] + " Steps Taken: " + maxValues[0][i]);
	
		}

	}

	//recursive function that return the number of steps needed to return
	//	to one for the input number
	private static long collatzStep(long input){
	
		int count = 0;

		if(input == 1){
			return 0;
		}else if(input%2 == 1){
			count += collatzStep(input*3+1);
		}else{
			count += collatzStep(input/2);
		}

		count++;
		return count;

	
	}
}
