
#

# QUIZ 1

# Tengisbold Batsaikhan

# 12/9

# ax^2 + bx + c

#

	.data
str1:	.asciiz, "Enter a number for x: "
str2:	.asciiz, "Enter a number for a: "
str3:	.asciiz, "Enter a number for b: "
str4:	.asciiz, "Enter a number for c: "
str5:	.asciiz, "ax^2 + bx + c = "

	.text
	.globl main

main:
	la	$a0, str1			# cout << str1
	li	$v0, 4
	syscall

	li	$v0, 6				# cin >> $f1
	syscall
	mov.s	$f1, $f0 			# $f1 = x

	la	$a0, str2			# cout << str2
	li	$v0, 4
	syscall

	li	$v0, 6				# cin >> $f2
	syscall
	mov.s	$f2, $f0  			# $f2 = a

	la	$a0, str3			# cout << str3
	li	$v0, 4
	syscall

	li	$v0, 6				# cin >> $f3
	syscall
	mov.s	$f3, $f0  			# $f3 = b

	la	$a0, str4			# cout << str4
	li	$v0, 4
	syscall

	li	$v0, 6				# cin >> $f4
	syscall
	mov.s	$f4, $f0  			# $f4 = c

	mul.s	$f0, $f1, $f2			# $f0 = ax
	nop
	nop
	add.s	$f0, $f0, $f3			# $f0 = ax + b
	mul.s	$f0, $f0, $f1			# $f0 = ax^2 + bx
	nop
	nop
	add.s	$f0, $f0, $f4			# $f0 = ax^2 + bx + c

	la	$a0, str5			# cout << str5
	li 	$v0, 4
	syscall

	li	$v0, 2				# cout << ax^2 + bx + c
	mov.s	$f12, $f0
	nop
	syscall

	li	$v0, 10
	syscall
