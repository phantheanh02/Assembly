# Phan Thế Anh - 20204941
# 20/6/2022
# Bubble Sort Program

.text
.globl main
main:
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	
	la $a0, array_base
	lw $a1, array_size
	jal BubbleSort
	
	jal PrintNewLine
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	
	jal Exit
.data
array_size: .word 5
array_base:
	.word 5
	.word 4
	.word 3
	.word 6
	.word 1
.include "utils.asm"
