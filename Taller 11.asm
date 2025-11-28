section .data
    msg db "Resultado: ", 0
    len equ $ - msg

    cero db "---El divisor es 0--", 0
    lenCero equ $ - cero

    newline db 10, 0
    lenNL equ $ - newline

section .bss
    resultado resb 1

section .text
    global _start

_start:
    ; ============================
    ; Números hardcoded
    ; ============================
    mov al, '4'       ; primer número (ASCII)
    sub al, '0'       ; convertir a entero (8)

    mov bl, '2'       ; segundo número (ASCII)
    sub bl, '2'       ; convertir a entero (2)
    

    ; ============================
    ; División AL / BL
    ; ============================
    cmp bl, 0          ; Comparar si el divisor es 0
    je .dividendo_cero
    
    xor ah, ah        ; limpiar AH para div
    div bl            ; resultado en AL

    ; ============================
    ; Convertir resultado a ASCII
    ; ============================
    add al, '0'
    mov [resultado], al

    ; ============================
    ; Imprimir "Resultado: "
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; ============================
    ; Imprimir el resultado
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    ; ============================
    ; Imprimir salto de línea
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lenNL
    int 0x80

    ; ============================
    ; Salir
    ; ============================
    mov eax, 1
    xor ebx, ebx
    int 0x80
.dividendo_cero:
    mov eax, 4
    mov ebx, 1
    mov ecx, cero
    mov edx, lenCero
    int 0x80