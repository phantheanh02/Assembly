# Phan Thế Anh - 20204941
# 20/6/2022
# Program 10.2: Print an array

.text
.globl main
main:
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	jal Exit
	
.data
array_size: .word 5
array_base:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
.include "utils.asm"
