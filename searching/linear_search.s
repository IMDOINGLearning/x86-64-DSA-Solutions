global _start
extern printf, scanf

section .data
    array db 1, 4, 7, 9, 14, 17, 39, 56
    message db "Please enter a target for [1, 4, 7, 9, 14, 17, 39, 56]", 0x0a
    notFound db "Target not found", 0x0a
    Found db "Target Found at index", 0x0a
    inFormat db "%d", 0x00
    outFormat db "%d", 0x0a, 0x00

section .bss
    target resb 1
    index resb 1

section .text
_start:
    call printMessage
    call getInput
    call initSearchLoop
    call search_loop


initSearchLoop:
    xor rax, rax
    xor rsi, rsi
    xor rcx, rcx
    xor rdx, rdx
    mov rsi, array
    mov al, [target]
    mov rcx, 0
    mov rdx, 8

search_loop:
    cmp al, [rsi]
    je found
    inc rcx
    inc rsi
    dec rdx
    jnz search_loop
    jmp printNotFound
    ret


printNotFound:
    mov rax, 1
    mov rdi, 1
    mov rsi, notFound
    mov rdx, 17
    syscall
    call Exit

printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 55
    syscall
    ret

getInput:
    sub rsp, 8
    mov rdi, inFormat
    mov rsi, target
    call scanf
    add rsp, 8
    ret

printFound:
    mov rax, 1
    mov rdi, 1
    mov rsi, Found
    mov rdx, 22
    syscall
    ret

found:
    mov [index], rcx
    call printFound
    sub rsp, 8
    mov rdi, outFormat
    mov rsi, [index]
    call printf
    add rsp, 8
    call Exit


Exit:
    mov rax, 60
    mov rdi, 0
    syscall
