#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/9

# calculate Newton's method x' = (x + n/x)/2

#


	.data
str1:	.asciiz, "Enter a number for n: "
str2:	.asciiz, "Square root is: "

	.text
	.globl main

main:
	la	$a0, str1			# cout << str1
	li	$v0, 4
	syscall

	li	$v0, 6				# cin >> n
	syscall

	li.s	$f1, 1.0				# $f1 = x = 1
	li.s 	$f2, 2.0				# $f2 = 2
	li.s 	$f3, 0.00001			# $f3 = 0.00001

loop:
	div.s	$f4, $f0, $f1			# $f4 = n/x
	nop
	nop
	add.s	$f4,$f1, $f4 			# $f4 = x + n/x
	div.s	$f4, $f4, $f2			# $f4 = (x + n/x)/2 = x'
	nop
	nop
	sub.s 	$f5, $f4, $f1			# $f5 = x' - x
	abs.s 	$f5, $f5			# $f5 = | x' - x |
	c.lt.s	$f5, $f3			# | x' - x | < 0.00001
	bc1t	exit
	nop
	mov.s 	$f1, $f4			# x' = x
	j loop
	nop

exit:
	la	$a0, str2			# cout << str2
	li 	$v0, 4
	syscall

	mov.s 	$f12, $f4			# cout << x'
	li 	$v0, 2
	syscall

	li $v0, 10
	syscall
