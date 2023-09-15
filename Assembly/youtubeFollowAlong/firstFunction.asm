;Project: Functions, stacks, and arguments
;Author: Cho Maddic
;Purpose: Learn asm

;Functionality: This program should ask for an integer from the user, and then store their response
; it should then pass that int into the function and the funtion should print something that many 
; times.


section .data
    msg db "Enter a number: "
    msgLen equ $ - msg  ;This line is not needed, it just makes the len dynamic

    msg2 db "The number you entered was: "
    msg2Len equ $ - msg2    ;This line is not needed, it just makes the len dynamic

;The .bss section is used to store variables that are not yet initalized 
;Syntax is <name resb byteAmount> where resb means reserve bytes
; this will reserver x amount of btyes in memory for that variable
section .bss
    userInput resb 64 ;allocating 256 bytes for this int which should allow for the number 2^256 - 1

;start program here
;"global" allows us to call this program from anywhere 
global _start


;dis where the code goes
section .text
_start:
    ;This first section will call sys_write to write code to the console
    mov eax, 4	;The number 4 denotes a sys_write call
	mov ebx, 1	;ebx is set to 1 since that is the file descriptor for stdout
	mov ecx, msg	;Pointer to the string to write
	mov edx, msgLen 	;Number of bytes to write
	int 0x80	;Perform the systemcall

    ;This next section of code will call sys_read to accept input for the previous question
    mov eax, 3  ;3 indicated the sys_read system call
    mov ebx, 0  ;0 indicates the file descriptor "stdin" or "standard-in" for reading input from the keyboard
    mov ecx, userInput ;Pointing ecx to the buffer that we set in .bss
    mov edx, 64  ;Max amount of bytes to read
    int 0x80    ;interrupt to start the syscall
    ;The eax register will hold the number of bytes read or the error code if failed

    push ecx ;the users input was stored in ecx so we push that to the stack to reference later on

    call function   ;calls the function "function"
    mov eax, 1  ;After the function executes it will return to this line of code 
    mov ebx, 0 ;We set the sys call to 1 and the return value to 0 and then interrupt to stop the program
    int 0x80


;The first part of the funtion where we preserve the stack and where you also allocate space
; is known as the prologue of the function
;The last part of the funtion where you restore the stack and return is called the epilogue
;We first push the old value of ebp onto the stack to preserve it then
; move the stack pointer into the base pointer. The stack pointer ESP is the top of our stack
; this will allow us to keep track of where the stack was when we first called this function and
; when we are at the end of this function we can move ebp back into esp to reset the location
;Functionality: Take the value stored in userInput and count to that number
function:
    push ebp    
    mov ebp, esp
    mov edi, [ebp+8]    ;edi is now holding the users input 
    ;We add 8 bytes here in order to jump back in the stack since we pushed to it twice
    ; each push is 32 bits since this is x86_32, and 32 bits is 4 bytes which is the size of
    ; each memory address

    ;This first section will call sys_write to write code to the console
    mov eax, 4	;The number 4 denotes a sys_write call
	mov ebx, 1	;ebx is set to 1 since that is the file descriptor for stdout
	mov ecx, msg2	;Pointer to the string to write
	mov edx, msg2Len 	;Number of bytes to write
	int 0x80	;Perform the systemcall

    ;This first section will call sys_write to write code to the console
    mov eax, 4	;The number 4 denotes a sys_write call
    mov ebx, 1	;ebx is set to 1 since that is the file descriptor for stdout
    mov ecx, edi	;Pointer to the string to write
    mov edx, 64 	;Number of bytes to write
    int 0x80	;Perform the systemcall

    mov esp, ebp
    pop ebp
    ret




  
;Extra caution for buffer overflow attacks
    ; Check if the length of the input exceeds the buffer size (256 bytes)
    ;cmp eax, 256
    ;ja input_too_long ; Jump if above (input is too long)