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
//void listSort(int* list);


int main(){

	//stores the top ten highest values and the steps to 1
	long maxValues[2][10] = {{8,6,2,7,4,1,3,2,5,0},{0,0,0,0,0,0,0,0,0,0}};

	//listSort(maxValues);

	for(int i = 0; i < 10; i++){
		//cout << maxValues[i] << endl;;
	}

	//the location of the minimum value in the array
	long minVal = 0;

	bool twoStep = false;

	//cout << numeric_limits<long>::max() << endl;

	//cout << LONG_MAX << endl;

	//The max value for int is 113383

	for (long i = 2; i < 5000000000; i++){

		long col = i;
		long count = 0;

		while(col != 1){
	
			count += 1;
			col = collatzStep(col, twoStep);
			if(col < 0){
				cout << "overflow occured" << col << endl;
				return 1;
			}			
//cout << col << endl;
		}	
			if(count > maxValues[0][minVal]){
				//cout << "right here" << endl;
				
				for(int j = 0; j < 10; j++){
					//cout << "in for" << endl; 
					if (j == minVal){
						maxValues[0][j] = count;
						maxValues[1][j] = i;
					}
				}
				minVal = 0;
				//cout << "here" << endl;
				for(int j = 0; j < 10; j++){
					if (maxValues[0][j] < maxValues[0][minVal]){
						minVal = j;
					}
				}

			}

	}

	for(int i = 0; i < 10; i++){

		cout << "Value: " << maxValues[1][i] << " Steps Taken: " << maxValues[0][i] << endl;

	}

	

	return 1;

}

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
	for(int i = 9; i >= 0; i--){

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
