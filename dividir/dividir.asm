SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data 

    msg1 db "La division entre 8 y 4 es: "
    len1 equ $- msg1 


section .bss
    res resb 1  

section	.text
    global _start    

_start:

    mov	eax, '8'
    sub eax,'0'

    mov ecx, '4'
    sub ecx,'0'

    div ecx
    add	eax,'0'
    
    ; moviendo el resultado a la variable res
    mov [res], eax

    ; Mensaje
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, msg1         
    mov edx, len1        
    int 0x80 

    ; Impresion de la division
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 2        
    int 0x80    

fin:    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80