// Project: Arguments 
// Author: Cho Maddic
// Purpose: Learn Arguments

// Program Functionality:

// Start of Program 
#include <stdio.h>

// argc is the number of command line arugments passed into the program when called
// argc's first argument is always the name of the program itself 
// char** argv is a pointer to the array of strings that contains the command line arguments
int main(int argc, char** argv){
    printf("This should print the number of arguments used to call this program (argc): %d \n", argc);

    printf("This should print each argument used to call the program (argv): \n");
    for(int i = 0; i < argc; i++){
        printf("%d: %s \n", i, argv[i]);
    }
    
}