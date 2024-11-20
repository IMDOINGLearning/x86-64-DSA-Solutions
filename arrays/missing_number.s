global _start
extern printf

section .data
    array db 1, 2, 3, 4, 6, 7, 9, 8, 10
    n db 10
    message db "Missing Number in [1, 2, 3, 4, 6, 7, 9, 8, 10] is", 0x0a
    outFormat db "%d", 0x0a, 0x00

section .text
_start:
    call printMessage
    call init
    call sum
    call missing_number
    call printMissingNumber
    call Exit

printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 50
    syscall
    ret

printMissingNumber:
    sub rsp, 8
    mov rdi, outFormat
    mov rsi, rax
    call printf
    add rsp, 8
    ret

init:
    xor rax, rax
    xor rcx, rcx
    xor rbx, rbx
    xor rsi, rsi
    xor rdx, rdx
    mov rsi, array
    mov al, [n]
    mov rcx, 0
    mov rbx, 9
    ret

sum:
    add cl, [rsi]
    inc rsi
    dec rbx
    jnz sum
    ret

missing_number:
    mov rbx, rax
    inc rbx
    mul rbx
    mov rbx, 2
    div rbx
    sub rax, rcx
    ret

Exit:
    mov rax, 60
    mov rdi, 0
    syscall 
