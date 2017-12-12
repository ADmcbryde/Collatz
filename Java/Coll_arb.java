/* CSC 330
 * Assignmant 3 - Collatz Conjecture
 *
 * Author: Devin McBryde
 *
 *
 */

import java.math.BigInteger;

public class Coll_arb{

	public static void main(String[] args){	

		//stores the top ten highest values and the steps to 1
		BigInteger maxValues[][] = new BigInteger[2][10];

		for (int i = 0; i < 10; i++){
			maxValues[0][i] = BigInteger.ZERO;
			maxValues[1][i] = BigInteger.ZERO;
		}
	
		//the location of the minimum value in the array
		int minVal = 0;	

		BigInteger test = new BigInteger("5");

		if(test.testBit(2)){
			//System.out.println("true");
		}

		//Main loop that goes through all values between 2 and 5000000000
		//	Top value has the L suffix since literals are interpreted as integers	
		for (BigInteger i = new BigInteger("1000000000000000"); i.compareTo(BigInteger.valueOf(2)) == 1; i = i.subtract(BigInteger.ONE) ){

			boolean alreadyexists = false;

			//reset the next two values for the new number
			//col holds the value of the iterated number
			BigInteger col = i;
			//count tracks the number of iterations total
			BigInteger count = new BigInteger("0");
	
			//Here we iterate values until they hit 1
			while(col.compareTo(BigInteger.valueOf(1)) != 0){
		
				//next two lines use the function, however the program then
				//	runs much slower
				//count += 1;
				//col = collatzStep(col);
				
				//This if statement will perform the operations the collatz sequence
				if( col.testBit(0) ){

					//If the number is odd the next number must be even
					//	therefore we can avoid logic checks by 
					//	performing both operations and adding 2
					//	to the count
					col = col.multiply(BigInteger.valueOf(3)).add(BigInteger.valueOf(1));
					count = count.add(BigInteger.ONE);
				}else{
					//If the number is even we divide by two and add one to count
					col = col.divide(BigInteger.valueOf(2));
					count = count.add(BigInteger.ONE);
				}			
				
				//check for some overflow
				//if(col < 0){
				//	System.out.println("overflow occured");
				//	break;
				//}			
			}	

			//Here we avoid having a value with a duplicate number of steps using the boolean flag
			for(int j = 0; j < 10; j++){
				//We check if our count has been recorded already
				if (count.compareTo(maxValues[0][j]) == 0 ){
					alreadyexists = true;
				}
			}

			//Here we check if the count is larger than the smallest count recorded and add if it is
			if(count.compareTo(maxValues[0][minVal]) == 1 && !alreadyexists){

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
					if (maxValues[0][j].compareTo(maxValues[0][minVal]) == -1){
						minVal = j;
					}
				}

			}
			
	
		}
	
		
		//Now we perform a basic selection sort on the step count before printing
		for(int i = 0; i < 9; i++){

			BigInteger minValue = maxValues[0][i];
			BigInteger minColNum = maxValues[1][i];
			int minLocale = i;
	
			for(int j = i+1; j < 10; j++){
	
				if(minValue.compareTo(maxValues[0][j]) == -1){
					minValue = maxValues[0][j];
					minColNum = maxValues[1][j];
					minLocale = j;
				}
	
			}
	
			BigInteger tempVal = maxValues[0][i];
			BigInteger tempNum = maxValues[1][i];
	
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

	//Function that will perform a collatz step
	private static long collatzStep(long input){
	
		if(input%2 == 1){
			input = input*3 +1;
			}else{
			input = input/2;
		}
	
		return input;
	
	}
}
