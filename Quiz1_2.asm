
#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/9

# ax^2 + bx + c

#

	.data
str1:	.asciiz, "\nEnter a number for x: "
str2:	.asciiz, "\nEnter a number for a: "
str3:	.asciiz, "\nEnter a number for b: "
str4:	.asciiz, "\nEnter a number for c: "
str5:	.asciiz, "ax^2 + bx + c"
str6:	.asciiz. "\nax^2 + bx + c = "

	.text
	.globl main

main:
#----------PRINT ON CONSOLE-------------  
	la	$a0, str5			# cout << str1
	la	$a0, str1
	li	$v0, 4
	syscall
#----------READ THE FLOAT FOR X--------------
	li	$v0, 6				
	syscall
	mov.s	$f9, $f0 			
#----------PRINT ON CONSOLE------------- 
	la	$a0, str2			
	li	$v0, 4
	syscall
#----------READ THE FLOAT FOR A--------------
	li	$v0, 6				
	syscall
	mov.s	$f8, $f0  			
#----------PRINT ON CONSOLE------------- 
	la	$a0, str3			
	li	$v0, 4
	syscall
#----------READ THE FLOAT FOR B--------------
	li	$v0, 6			
	syscall
	mov.s	$f7, $f0  			
#----------PRINT ON CONSOLE------------- 
	la	$a0, str4			
	li	$v0, 4
	syscall
#----------READ THE FLOAT For C--------------
	li	$v0, 6				
	syscall
	mov.s	$f6, $f0  			
#----------PROCESS THE CALCULATION----------
	mul.s	$f0, $f9, $f9			
	nop
	mul.s	$f0, $f0, $f8
	nop
	mul.s	$f7, $f7, $f9
	nop
	add.s	$f0, $f0, $f7			
	add.s	$f0, $f0, $f6
	mov.s	$f12, $f0
#----------PRINT ON CONSOLE-------------  
	la	$a0, str6			
	li 	$v0, 4
	syscall
	li	$v0, 2				
	syscall
#----------EXIT THE PROGRAM------------- 
	li	$v0, 10
	syscall
