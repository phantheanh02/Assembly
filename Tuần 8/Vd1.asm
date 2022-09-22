# Phan Thế Anh -- 20204941
# 6/6/2022
# Program 8.3 Quadratic program
# Purpose: register indirect access

.text
.globl main

main:
	# Get input and store it in $s0
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	# Load constants a,b and c into register
	lui $t0, 0x1001
	lw $t5, 0($t0)
	addi $t0, $t0, 4
	lw $t6, 0($t0)
	addi $t0, $t0, 4
	lw $t7, 0($t0)
	
	# Calculate y = a*x*x + b
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t6
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	
	# Print ouput from y
	la $a0, result
	move $a1, $s1
	jal PrintInt
	jal PrintNewLine
	
	# Exit
	jal Exit
	
.data
	.word 5
	.word 2
	.word 3
y:	.word 0
prompt: .asciiz "Enter a value for x: "
result: .asciiz "The result is: "

.include "utils.asm"	
	