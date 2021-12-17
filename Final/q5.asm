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
    lui $t0, 0xffff    #load upper imm to get the address of receiver
wait:
    lw      $t1, 0($t0)      #to check receiver control
    andi    $t1, $t1, 0x0001        #to check receiver control ready bit is 1 or 0
    beq     $t1, $zero, wait
    lw      $s0, 4($t0)
    sub      $s0, $s0, 48
    mul     $s0, $s0, 10
    add     $s1, $s1, $s0
    sub     $s7, $s7, 1
    beq     $s7, $zero, print
    nop
    

print:
    add $a0, $s1, $zero
    li $v0, 1
    syscall
    li $v0, 10
    syscall
    