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

    or $s1, $zero, $zero
    ori $s7, 3
    ori $s6, 10
    lui $t0, 0xffff    #load upper imm to get the address of receiver

wait:
    lw      $t1, 0($t0)      #to check receiver control
    andi    $t1, $t1, 0x0001        #to check receiver control ready bit is 1 or 0
    beq     $t1, $zero, wait
    nop

    lw      $s0, 4($t0)
    li      $v0, 5
    syscall

    addi     $s0, $s0, -48    
    mult     $s1, $s6
    mflo     $s1
    addu     $s1, $s1, $s0
    addi     $s7, $s7, -1
    bgez     $s7, wait

    nop

    add $a0, $s1, $zero
    li $v0, 1
    syscall
    li $v0, 10
    syscall
    