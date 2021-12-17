#q5.asm
#Question 1
#Tengisbold Batsaikhan
#12/16/2021

    .text
    .globl main
main:
    lui $t1, 0xffff    #load upper imm to get the address of receiver
wait:
    lw $t2, 0($t1)      #to check receiver control
    andi    $t2, $t2, 0x0001        #to check receiver control ready bit is 1 or 0
    beq    $t2, $zero, wait
    lw      $t3, 4($t0)
    syscall
    