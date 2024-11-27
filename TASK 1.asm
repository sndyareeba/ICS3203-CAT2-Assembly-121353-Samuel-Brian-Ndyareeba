.model small
.stack 100h
.data
    prompt_num     db 'Enter a number: $'
    positive_msg   db 'POSITIVE$'
    negative_msg   db 'NEGATIVE$'
    zero_msg       db 'ZERO$'
    reversed_msg   db 'Reversed Array: $'
    input_number   dw 0
    input_array    dw 5 dup(?)

.code
main PROC
    ; Task 1: Number Classification
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 09h
    lea dx, prompt_num
    int 21h

    ; Read number
    mov ah, 01h
    int 21h
    sub al, '0'
    mov input_number, ax

    ; Classify number
    cmp ax, 0
    je is_zero
    jg is_positive
    jl is_negative

is_zero:
    lea dx, zero_msg
    jmp print_result

is_positive:
    lea dx, positive_msg
    jmp print_result

is_negative:
    lea dx, negative_msg

print_result:
    mov ah, 09h
    int 21h

    ; Task 2: Array Reversal
    mov cx, 5        ; Array size
    lea si, input_array
    
input_loop:
    mov ah, 01h      ; Read digit
    int 21h
    sub al, '0'
    mov [si], ax
    inc si
    loop input_loop

    ; Reverse array in-place
    lea si, input_array
    lea di, input_array + 8  ; Point to last element
    mov cx, 2        ; Half array length

reverse_loop:
    mov ax, [si]
    mov bx, [di]
    mov [si], bx
    mov [di], ax
    add si, 2
    sub di, 2
    loop reverse_loop

    ; Task 3: Factorial Calculation
    mov ax, input_number
    mov cx, ax       ; Loop counter
    mov bx, 1        ; Result accumulator

factorial_loop:
    mul cx           ; Multiply current result
    dec cx
    jnz factorial_loop

    ; Task 4: Sensor Control Simulation
    mov ax, input_number  ; Simulate sensor input

    cmp ax, 100      ; High threshold
    jae high_level
    cmp ax, 50       ; Moderate level
    jae moderate_level
    jmp low_level

high_level:
    ; Trigger high-level actions
    mov bx, 1
    jmp exit_program

moderate_level:
    ; Stop motor actions
    mov bx, 0
    jmp exit_program

low_level:
    ; Normal operation
    mov bx, 2

exit_program:
    mov ah, 4Ch      ; Exit to DOS
    int 21h
main ENDP
END main