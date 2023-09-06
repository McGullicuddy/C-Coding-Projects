// Project: Pointers&Addresses 
// Author: Cho Maddic
// Purpose: Learn Pointers

// Program Functionality: Print variable values using different pointer and address methods

// Start of Program 
#include <stdio.h>

int main(){
    int x = 10; 
    int *pX = &x; 
    int y = *pX;

    printf("This should print the number 10: %d\n", x);

    printf("This should print the number 10: %d\n", *pX);

    printf("This should print the address of variable x: %p\n", &x);

    //What I am doing here is passing the value of x by reference rather than by direct value.
    // But why? cleaner code, out of scope, and dynamic memory allocation in the heap  
    printf("This should print the number 10: %d\n", y);

    return 0;
}