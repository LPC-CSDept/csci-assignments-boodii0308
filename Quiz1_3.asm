#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/17

# calculate Newton's method x' = (x + n/x)/2



	.data
str1:	.asciiz, "Enter a number for n: "
str2:	.asciiz, "Square root is: "

	.text
	.globl main

main:
#----------PRINT ON CONSOLE-------------  
	la	$a0, str1			
	li	$v0, 4
	syscall
#----------READ FLOAT FOR N------------  
	li	$v0, 6				
	syscall
#----------SETTING VARIABLE------------  
	li.s	$f1, 1.0				
	li.s 	$f2, 2.0				
	li.s 	$f3, 0.00001			
#----------LOOP-------------  
loop:
	mov.s	$f4, $f0				#setting nee x

	div.s	$f4, $f4, $f1			#x' = n/x
	nop
	add.s	$f4, $f1, $f4 			#x' = x + n/x
	div.s	$f4, $f4, $f2			#x' = ( x + n/x) / 2
	nop
	sub.s 	$f5, $f4, $f1			#x' - x
	abs.s 	$f5, $f5			#taking absolute value
	c.lt.s	$f5, $f3			#checking | x' - x | is less than f3 which is 0.00001
	bc1t	loop
	nop
#----------PRINT ON CONSOLE-------------
	la	$a0, str2			
	li 	$v0, 4
	syscall
	mov.s 	$f12, $f4	
	li 	$v0, 2
	syscall
#----------EXIT THE PROGRAM------------- 
	li $v0, 10
	syscall
