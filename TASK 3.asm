.model small
.stack 100h

.data
num db 5               ; Example input number (can be changed)
result dw ?            ; Variable to store the result
msgResult db 'Factorial is: $'

.code
; Subroutine to compute factorial
factorial proc near
    push ax            ; Preserve AX on stack
    push cx            ; Preserve CX on stack

    mov cx, num        ; Load number into CX (CX will be our counter)
    mov ax, 1          ; Initialize AX to 1 (factorial of 0 is 1)

factorial_loop:
    mul cx             ; Multiply AX by CX (AX = AX * CX)
    loop factorial_loop ; Decrement CX and loop if CX != 0

    pop cx             ; Restore CX from stack
    pop ax             ; Restore AX from stack
    ret                 ; Return to caller
factorial endp 

main proc 
    mov ax, @data 
    mov ds, ax 

    call factorial      ; Call factorial subroutine
    
    ; Display result message (not fully implemented)
    lea dx, msgResult   
    mov ah, 09h        ; DOS function to display string 
    int 21h            ; Call DOS interrupt 

    ; Convert result in AX to string and display it (not shown here)
    
    mov ah, 4ch        ; Terminate program 
    int 21h 
main endp 
end main 