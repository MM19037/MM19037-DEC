SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data 

    msg1 db "Ingresa el primer numero: (0-9)", 0xA,0xD
    len1 equ $- msg1 

    msg2 db "Ingresa el segundo numero: (0-9)", 0xA,0xD
    len2 equ $- msg2 

    msg3 db "La multiplicacion de los numeros ingresados es: "
    len3 equ $- msg3

section .bss

    num1 resb 2 
    num2 resb 2 
    res resb 1    

section	.text
    global _start    

_start:

    ; limpiar registros
    mov eax,0
    mov ebx,0
    mov ecx,0
    mov edx,0

    ; Mensaje para solicitar el primer numero
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg1         
    mov edx, len1 
    int 0x80        
    
    ; Lectura del primer numero
    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, num1 
    mov edx, 2
    int 0x80

    ; Mensaje para solicitar el segundo numero
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg2        
    mov edx, len2 
    int 0x80   
    
    ; Lectura del segundo numero
    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, num2 
    mov edx, 2
    int 0x80

    ; Mensaje par indicar el resultado
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg3          
    mov edx, len3         
    int 0x80

    ; Moviendo numeros a registros de 8 bit parte baja
        
    mov al, [num1]
    sub al, '0'
        
    mov bl, [num2]
    sub bl, '0'

    ; Multiplicando bl por al
    imul bl
    add al, '0'

    ; moviendo el resultado a la variable res
    mov [res], al

    ; Impresion de la multiplicacion
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 1        
    int 0x80    

fin:    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80