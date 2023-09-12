;start program here
global _start

section .text
_start:
    mov ecx, 99
    mov eax, 1  ;sys_exit
    mov ebx, 42 ;exit status is 42
    cmp ecx, 100    ;compares ecx to 100 and sets bit flag accordingly
    jl skip    ;jump to the lable named skip
    mov ebx, 13 ;change exit status to 13
skip:
    int 0x80