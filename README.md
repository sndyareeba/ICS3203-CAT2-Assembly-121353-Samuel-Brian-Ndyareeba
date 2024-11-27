# ICS3203 CAT2 Assembly 121353 Samuel Brian Ndyareeba
 This is a project for the Contious Assessment 2

# Task 1
## Conditional Jumps: 
The je (jump if equal) and jg (jump if greater) instructions are used to control the flow based on the comparison results. This allows the program to branch into different sections based on whether the number is zero or positive.
## Unconditional Jumps: 
The jmp instruction is used to transfer control unconditionally to the specified label (e.g., end). This ensures that after displaying a message, the program exits cleanly.

# Task 3
##Data Types:
The variable num is defined as db (byte), which is appropriate since it holds a single-digit number. However, if you want to handle larger numbers, consider using dw for a word-sized value.
The result variable is defined as dw, which can store the result of the multiplication.
## Using Registers:
The program correctly uses CX as a loop counter and initializes AX to 1. This is necessary because the factorial calculation starts from 1.
The multiplication operation (mul cx) automatically uses DX:AX for larger results. If the result exceeds what can be stored in AX, it will be stored in DX.
## Loop Control:
The loop instruction decrements CX and continues looping until CX reaches zero. This ensures that we multiply all integers down to 1.
## Output Handling:
The output message is set up but not fully implemented for displaying the result. You would typically need additional code to convert the binary result in AX into a string format for display.

# Task 4
## Sensor Input Handling: 
The program uses conditional jumps based on the simulated sensor value to determine which action to take (turning on/off motor or triggering an alarm).
## Memory Manipulation: 
The status messages are stored in data segments and displayed based on conditions evaluated from sensor data. This approach keeps memory usage efficient while allowing clear control flow based on input conditions.
