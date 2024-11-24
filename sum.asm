section .data
    limit db 100, 0          ; The upper limit for the sum (100 in this example)
    result db "Sum: ", 0
    newline db 10, 0

section .bss
    sum resb 4               ; Storage for the calculated sum

section .text
    global _start

_start:
    ; Initialize registers
    xor eax, eax             ; Clear eax (current sum)
    xor ebx, ebx             ; Clear ebx (counter)

    mov cl, [limit]          ; Load the limit into cl (loop counter)

compute_sum:
    add eax, ebx             ; Add the current counter (ebx) to the sum (eax)
    inc ebx                  ; Increment the counter
    cmp ebx, ecx             ; Compare the counter with the limit
    jle compute_sum          ; If the counter <= limit, continue the loop

    ; Store the result in the sum variable
    mov [sum], eax

    ; Output the result
    mov rsi, result          ; Message "Sum: "
    call print_string

    mov eax, [sum]           ; Load the result into eax
    call int_to_str          ; Convert integer to string
    mov rsi, rdi             ; Move pointer to the string result
    call print_string

    mov rsi, newline         ; Print newline
    call print_string

    ; Exit program
    mov rax, 60              ; syscall: exit
    xor rdi, rdi             ; status: 0
    syscall

; Helper functions

print_string:
    mov rax, 1               ; syscall: write
    mov rdi, 1               ; file descriptor: stdout
    mov rdx, strlen          ; calculate string length
    syscall
    ret

int_to_str:
    mov rdi, sum             ; Pointer to output buffer
    xor rcx, rcx             ; Clear character count
    mov rbx, 10              ; Base 10 divisor
.loop:
    xor rdx, rdx             ; Clear remainder
    div rbx                  ; Divide rax by 10
    add dl, '0'              ; Convert digit to ASCII
    dec rdi                  ; Move pointer backward
    mov [rdi], dl            ; Store character
    inc rcx                  ; Increment count
    test rax, rax            ; Check if quotient is 0
    jnz .loop                ; Repeat if not
    ret

strlen:
    mov rcx, -1              ; Counter
    xor al, al               ; Null terminator
.loop:
    inc rcx
    cmp byte [rsi + rcx], al ; Check for null byte
    jne .loop
    mov rax, rcx
    ret
