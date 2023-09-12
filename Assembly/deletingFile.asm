;start program here
global _start

;adding in a section called data so we can create data to later reference
section .data

    ;DB stands for "Define Byte"
	fileName db "file1", 0

;Create my text section
section .text
_start:
	mov eax, 10	;The number 10 denotes a sys_unlink call which should delete the link to the file
	mov ebx, fileName	;ebx is set to the file that we want to delete
	int 0x80	;Perform the systemcall

;The system call list can be found here faculty.nps.edu/cseagle/assembly/sys_call.html

	mov eax, 1	;First param for systemcall is 1 to call sys_exit
	mov ebx, 0	;We want the program to exit sucessfully so we indicate that using 0
	int 0x80	;Finally we call the systemcall

