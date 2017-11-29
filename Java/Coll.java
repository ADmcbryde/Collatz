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
		for (long i = 2; i < 5000000000L; i++){
	
			//col holds the value of the iterated number
			long col = i;
			//count tracks the number of iterations total
			long count = 0;
	
			//Here we iterate values until they hit 1
			while(col != 1){
		
				count += 1;
				col = collatzStep(col);
				//simple check to avoid infinite loop due to overflow
				if(col < 0){
					System.out.println("overflow occured");
					break;
				}			
			}	

			if(count > maxValues[0][minVal]){
				
				for(int j = 0; j < 10; j++){
					 
					if (j == minVal){
						maxValues[0][j] = count;
						maxValues[1][j] = i;
					}
				}
				minVal = 0;
				
				for(int j = 0; j < 10; j++){
					if (maxValues[0][j] < maxValues[0][minVal]){
						minVal = j;
					}
				}

			}
			
	
		}
	
		for(int i = 0; i < 10; i++){
	
			System.out.println("Value: " + maxValues[1][i] + " Steps Taken: " + maxValues[0][i]);
	
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
