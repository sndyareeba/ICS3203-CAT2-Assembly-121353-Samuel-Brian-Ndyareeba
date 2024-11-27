.model small
.stack 100h

.data
sensorValue db ?
motorStatus db 'Motor OFF$'
alarmStatus db 'Alarm OFF$'

.code
main proc 
   mov ax,@data 
   mov ds,ax 

   ;; Simulate reading sensor value; replace with actual read in real scenario.
   mov sensorValue ,50  

   cmp sensorValue ,75  
   jg trigger_alarm      
   
   cmp sensorValue ,30  
   jg stop_motor        
   
turn_on_motor:
   lea dx,motorStatus    
   mov ah ,09h          
   int 21h              
   jmp end_program      

trigger_alarm:
   lea dx ,alarmStatus   
   mov ah ,09h          
   int 21h              
   
stop_motor:
   lea dx,motorStatus    
   mov ah ,09h          
   int 21h              
 
end_program:
   mov ah ,4ch          
   int 21h              
main endp 
end main 