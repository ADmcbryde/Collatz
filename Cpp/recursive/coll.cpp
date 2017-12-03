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

int collatzStep(long input);
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

	for (long i = 2; i < 1000; i++){

		long col = i;
		long count = 0;

		/*while(col != 1){
	
			count += 1;
			col = collatzStep(col, twoStep);
			if(col < 0){
				cout << "overflow occured" << col << endl;
				return 1;
			}			
//cout << col << endl;
		}*/

		count = collatzStep(col);
	
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

		cout << "Value: " << maxValues[0][i] << " Steps Taken: " << maxValues[1][i] << endl;

	}

	

	return 1;

}

int collatzStep(long input){

	int counter = 0;

	if(input == 1){
		return 0;
	}else if(input%2 == 1){
		counter += collatzStep(input*3 +1);
	}else{
		counter += collatzStep(input/2);
	}

	counter = counter+1;
	return counter;

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
