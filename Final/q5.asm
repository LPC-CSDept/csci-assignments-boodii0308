#q5.asm

#Question 1

#Tengisbold Batsaikhan

#12/16/2021

#this program is looping throu 3 times to get the input after that prints out the saved number.

    .data
msg: .asciiz "Enter number: \n"

    .text
    .globl main
    
    main:
#----------PRINT ON CONSOLE-------------  
    la  $a0, msg
    syscall
#----------SETTING VARIABLE-------------  
    or $s1, $zero, $zero
    ori $s7, 2
    ori $s6, 10
    lui $t0, 0xffff    #load upper imm to get the address of receiver
#----------LOOP-------------  
wait:
    lw      $t1, 0($t0)      #to check receiver control
    andi    $t1, $t1, 0x0001        #to check receiver control ready bit is 1 or 0
    beq     $t1, $zero, wait       #if not ready, loop back to get input
    nop
    lw      $s0, 4($t0)     #get the digits start from ffff0004
    addi     $s0, $s0, -48    #-48 to get digit, because of ascii character 
    mult     $s1, $s6           #multiplying the saved main number by 10, at the beginning s1 = 0
    mflo     $s1                #taking the quotient
    addu     $s1, $s1, $s0      #adding last input to main numbers
    addi     $s7, $s7, -1       #-1 from loop counter
    bgez     $s7, wait          #if loop counter is >=0 it goes back to loop
    nop
#----------PRINT ON CONSOLE-------------  
    add $a0, $s1, $zero         #adding main number to register
    li $v0, 1                   #read the main number
    syscall     
#----------EXITING THE PROGRAM----------  
    li $v0, 10                  #exit the code
    syscall
    