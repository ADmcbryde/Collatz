/* CSC 330
 * Assignmant 3 - Collatz Conjecture
 *
 * Author: Devin McBryde
 *
 *
 */

#include <iostream>
#include <limits>

using namespace std;

long collatzStep(long input, bool &numStep);


int main(){

	//stores the top ten highest values and the steps to 1
	long maxValues[2][10] = {{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}};

	//the location of the minimum value in the array
	long minVal = 0;

	
	//This for loop will perform the collatz sequence on all
	//	values to be tested
	for (long i = 2; i < 1000000; i++){

		//Used to indicate if the current values step count is equal to
		//	any other value stored in the maxValues array
		bool alreadyexists = false;

		//col will temporarily store the current value to test
		long col = i;

		//count stores the number of steps needed to hit one 
		//	when performing the collatz sequence to col
		long count = 0;

		//performs the collatz sequence on col until it equals one
		while(col != 1){
			//next two lines use the function, however the program then
			//	runs much slower
			//count += 1;
			//col = collatzStep(col, twoStep);

			//This if statement will perform the operations the collatz sequence

			if(col&1){
				//If the number is odd the next number must be even
				//	therefore we can avoid logic checks by 
				//	performing both operations and adding 2
				//	to the count

				col = (col*3 +1)>>1;
				count+=2;
			}else{
				//If the number is even we divide by two and add one to count
				col = col>>1;
				count+=1;
			}

		}	

		//Here we avoid having a value with a duplicate number of steps using the boolean flag

		for(int j = 0; j < 10; j++){
			if(count == maxValues[0][j]){
				alreadyexists = true;
			}
		}

		//Here we check if the count is larger than the smallest count recorded and add if it is
		if(count > maxValues[0][minVal] && !alreadyexists){

			//here we replace the value of the smallest count			
			for(int j = 0; j < 10; j++){; 
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

		cout << "Value: " << maxValues[1][i] << " Steps Taken: " << maxValues[0][i] << endl;

	}

	

	return 1;

}

//Function that will perform a collatz step
long collatzStep(long input, bool &numStep){

	//int bit;

	if(input%2 == 1){
		input = input*3 +1;
	}else{
		input = input/2;
	}

	return input;

}

void listSort(int *list){

	int maxValue = -1;
	int maxLocale = -1;
	for(int i = 0; i < 10; i--){

		maxValue = -1;
		maxLocale = -1;

		for(int j = 0; j <= i; j++){

//			cout << j << endl;
			if(list[j] > maxValue){
				maxValue = list[j];
				maxLocale = j;
			}

		}

		int temp = list[i];
		list[i] = maxValue;
		list[maxLocale] = temp;

	}

}
