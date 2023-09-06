// Project: Calculator 
// Author: Cho Maddic
// Purpose: Coding project 

// Start of Program 

// Adds the IO library and math.h for pow function
#include <stdio.h>
#include <math.h>
#include <ctype.h>

int collectData();
int calculate(float a, char c, float b);

// Start of Main function
int main(){
    puts("NOTE: This calculator can only handle 2 numbers and the following operands. (+-/*%^) \n");

    while(1){
        collectData();
    }
}

int collectData(){
    // Initalize values s
    char operand;
    float value1;
    float value2;

    printf("Enter your equation here: ");

    if((scanf("%f %c %f", &value1, &operand, &value2)) != 3){
        printf("ERROR: Please only enter numerical values.");
    }
    // Using the %g format specifcer here to cut off any trailing 0s
    //printf("\n\nYour equation is: %g %c %g", value1, operand, value2);
    calculate(value1, operand, value2);
}

// I would like to take the results of collectData and pass that into this function to operate with
// NOTE: I am an idiot, I just call this function in the other function.  
// The goal of this function is to determine the operand with ifelse statements and output the result
int calculate(float a, char c, float b){

    float result;

        switch(c){
    case '+':
        result = (a + b); 
        break;
    case '-': 
        result = (a - b);
        break;
    case '*': 
        result = (a * b);
        break;
    case '/':
        if(b == 0){
            printf("Error: Cannot divide by '0'");
        }else{
            result = (a / b);
            break;
        }
    case '%':
        if(b == 0){
            printf("Error: Cannot modulo by '0'");
        }else{
            result = ((int)a % (int)b);
            break;
        }
//    case '^':
//        result = pow((double)a, (double)b);
//        break;
    default:
        return 1;
    }
    printf("Answer: %g \n\n", result);
    return 0;
}