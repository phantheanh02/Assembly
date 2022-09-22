# Phan Thế Anh - 20204941
# 30/5/2022
# Bài tập 7.1

.text
.globl main
main:
	# Lấy dữ liệu từ bàn phím
	la $a0, prompt
	jal PromptInt
	nop
	nop
	move $s0,$v0	# x
	# gán 
	li $t5, 5 	# a
	li $t6, 2	# b
	li $t7, 3	# c
	
	# Thực hiện phép tính: y = x*x*a + x*b + c
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t6
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	# In ra y
	la $a0, result
	move $a1, $s1
	jal PrintInt
	jal PrintNewLine
	nop
	jal Exit
	
.data
 y: .word 0
 prompt: .asciiz "Nhap so: "
 result: .asciiz "Ket qua: "
.include "utils.asm"
