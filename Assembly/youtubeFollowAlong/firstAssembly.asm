; Project: First Assembly Code
; Author: Cho Maddic
; Purpose: 
global _start
_start:
	mov eax, 1
	mov ebx, 69
	int 0x80
