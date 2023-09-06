// Project: My First Crackme 
// Author: Cho Khan Maddic
// Purpose: Learn C and Reversing 

// Program Functionality: This program will output the flag once the correct number has been input.
// I want the user to come to the correct answer by either finding that value, or using a debugger to modify the logic
// Answer is: 0x123415 = 1192981
// Flag is CKM{flag_is_this}

// Start of Program 
#include <stdio.h>

int main(){

    float inputValue;
    float answer = 0x123415; 

    while (1)
    {
        printf("Enter the correct value to receive the flag: ");
        scanf("%f", &inputValue);

        if(inputValue == answer){
            printf("CKM{flag_is_this}");
            return 0;
        }else{
            printf("Wrong... Guess again. \n\n");
        }
    }
}
