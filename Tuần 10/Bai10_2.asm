# Phan Thế Anh - 20204941
# 20/6/2022
# Bài tập 10.2: Chuyển thập phân (1 <= n <= 15) thành chữ số hệ cơ số 16

.text
.globl main
main:
	# Lấy số từ người dùng
	la $a0, prompt
	jal PromptInt
	sll $s0, $v0, 2
	
	bge $v0, 16, check 
	ble $v0, -1, check 

	# In ra giá trị thập lục phân
	la $t0, array_base
	add $t0, $t0, $s0
	la $a0, output
	jal PrintString
	
	move $a0, $t0
	jal PrintString
	
	# Exit
	jal Exit
	
check:
	la $a0, error
	jal PrintString
	jal Exit
.data
prompt: .asciiz "Enter a number from 0 to 15: "
output: .asciiz "Your number is "
error: .asciiz "Number is error!!"
array_size: .space 16 
array_base:
	.asciiz  "0x0"
	.asciiz "0x1"
	.asciiz "0x2"
	.asciiz "0x3"
	.asciiz "0x4"
	.asciiz "0x5"
	.asciiz "0x6"
	.asciiz "0x7"
	.asciiz "0x8"
	.asciiz "0x9"
	.asciiz "0xa"
	.asciiz "0xb"
	.asciiz "0xc"
	.asciiz "0xd"
	.asciiz "0xe"
	.asciiz "0xf"
.include "utils.asm"
