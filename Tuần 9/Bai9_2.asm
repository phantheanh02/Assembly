# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.2
# Phép nhân đệ quy	

.text
.globl main
main:
	# register conventions
	# $s0 - m
	# $s1 - n
	# $s2 - answer
	
	la $a0, prompt1	# Get m
	jal PromptInt
	move $s0, $v0
	
	la $a0, prompt2	# Get n
	jal PromptInt
	move $s1, $v0
	
	move $a0, $s0
	move $a1, $s1
	
	jal Multiply	# Do multiplication
	move $s2, $v0
	
	la $a0, result
	move $a1, $s2
	jal PrintInt
	
	jal Exit

Multiply:
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	seq $t0, $a1, $zero	# if n == 0 then return
	addi $v0, $zero, 0	# set return value
	bnez $t0, Return
	
	addi $a1, $a1, -1	# set n = n -1
	jal Multiply		# recurse
	lw $a0, 4($sp)		# retrieve m
	add $v0, $a0, $v0	# return m + multiply(m,n-1)
	
	Return:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
.data
prompt1: .asciiz "Enter the multiplicand: "
prompt2: .asciiz "Enter the multiplier: "
result: .asciiz "The answer is: "
.include "utils.asm"
	
	