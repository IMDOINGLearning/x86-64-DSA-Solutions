global _start
extern printf, scanf

section .data
    message db "Please input max Fn", 0x0a
    outFormat db "%d", 0x0a, 0x00
    inFormat db "%d", 0x00

section .bss
    userInput resb 1

section .text
_start:
    call printMessage
    call getInput
    call initFib
    call loopFib
    call Exit

printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi,message
    mov rdx, 20
    syscall
    ret

printFib:
    push rax
    push rbx
    mov rdi, outFormat
    mov rsi, rbx
    call printf
    pop rbx
    pop rax
    ret

getInput:
    sub rsp, 8
    mov rdi, inFormat
    mov rsi, userInput
    call scanf
    add rsp, 8
    ret

initFib:
    xor rax, rax
    xor rbx, rbx
    inc rbx
    ret

loopFib:
    call printFib
    add rax, rbx
    xchg rax, rbx
    cmp rbx, [userInput]
    js loopFib
    ret

Exit:
    mov rax, 60
    mov rdi, 0
    syscall
