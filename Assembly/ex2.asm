;start program here
global _start

;adding in a section called data so we can create data to later reference
section .data

	msg db "Hello, world!", 0x0a	;string of bytes calles msg containing the value Hello world, the 0x0a is the newline character

	len equ $ - msg		;dynamically setting len to the length of msg

;Create my text section
section .text
_start:
	mov eax, 4	;The number 4 denotes a sys_write call
	mov ebx, 1	;ebx is set to 1 since that is the file descriptor for stdout
	mov ecx, msg	;Pointer to the string to write
	mov edx, len 	;Number of bytes to write
	int 0x80	;Perform the systemcall

;So the idea here is that we are initalizing the systemcall 4 and the next three lines are the
;parameters that the systemcall sys_write needs in ordert to execute.

;The system call list can be found here faculty.nps.edu/cseagle/assembly/sys_call.html

	mov eax, 1	;First param for systemcall is 1 to call sys_exit
	mov ebx, 0	;We want the program to exit sucessfully so we indicate that using 0
	int 0x80	;Finally we call the systemcall
