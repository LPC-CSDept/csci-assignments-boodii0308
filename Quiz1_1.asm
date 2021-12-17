#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/16

# convert Fahrenheit to Celsius

#

	.data
mgs1:	.asciiz, "Enter an integer tempeture in Fahrenheit: "
msg2:	.asciiz, "The tempeture in Celsius is: "
Num1:	.word 0
	.text
	.globl main

main:
	ori $t1, 5
	ori $t2, 9
	div.s $s0, $t1, t2

#----------PRINT ON CONSOLE-------------  
	la	$a0, msg1			#loading address of msg 1
	li	$v0, 4				#system call code for print_str
	syscall
#----------READ THE INTEGER--------------
	li	$v0, 5				#getting  the integer
	syscall
	sw	$s1, Num1
#----------PROCESS THE CALCULATION----------
	mtc1	$s0, $s1
	cvt.s.w	$s0, $s0

	li.s	$s2, 32.0		
	sub.s 	$s2, $s0, $s2
	mul.s 	$f12, $s1, $s2 			
#----------PRINT ON CONSOLE-------------  
	la	$a0, msg2	
	li	$v0, 4
	syscall
	li	$v0, 2			
	syscall
#----------EXIT THE PROGRAM-------------  
	li	$v0, 10
	syscall

