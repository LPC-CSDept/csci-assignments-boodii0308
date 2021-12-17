#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/16

# convert Fahrenheit to Celsius

#

	.data
msg1:	.asciiz, "Enter an integer tempeture in Fahrenheit: "
msg2:	.asciiz, "\nThe tempeture in Celsius is: "
Num1:	.word 0
fl1:	.float 5.0
fl2:	.float 9.0
fl3:	.float 32.0
	.text
	.globl main

main:

#----------PRINT ON CONSOLE-------------  
	la	$a0, msg1			#loading address of msg 1
	li	$v0, 4				#system call code for print_str
	syscall
#----------READ THE INTEGER--------------
	li	$v0, 5				#getting  the integer
	syscall
#----------PROCESS THE CALCULATION----------
	l.s	$f8, fl1	
	l.s	$f9, fl2
	div.s	$f0, $f8,$f9		#dividing 5/9
	l.s	$f8, fl3
	mtc1	$v0, $f1		#moving integer to FP register
	cvt.s.w	$f1, $f1		#converting integer to single percision FP
			
	sub.s 	$f8, $f1,$f8 	#subtracting 32 from the main number 
	mul.s 	$f12, $f8, $f0 	#multiplying (input number - 32) by 5/9
#----------PRINT ON CONSOLE-------------  
	la	$a0, msg2	
	li	$v0, 4
	syscall
	li	$v0, 2			
	syscall
#----------EXIT THE PROGRAM-------------  
	li	$v0, 10
	syscall

