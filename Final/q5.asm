#q5.asm

#Question 1

#Tengisbold Batsaikhan

#12/16/2021

    .data
msg: .asciiz "Enter number: "

    .text
    .globl main
main:
    la  $a0, msg
    syscall

    ori $s7, 3
    lui $t1, 0xffff    #load upper imm to get the address of receiver
wait:
    lw      $t2, 0($t1)      #to check receiver control
    andi    $t2, $t2, 0x0001        #to check receiver control ready bit is 1 or 0
    beq     $t2, $zero, wait

    lw      $s0, 4($t2)
    sub      $s0, $s0, 48
    mul     $s0, $s0, 10
    nop

    add     $s1, $s1, $s1
    sub     $s7, $s7, 1
    beq    $t9, $zero, print
    nop
    

print:
    add $a0, $s1, $zero
    li $v0, 1
    syscall
    li $v0, 10
    syscall
    