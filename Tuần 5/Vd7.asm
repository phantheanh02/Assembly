# program 5.7
#  Chương trình n0hắc người dùng nhập vào, đọc và in ra số nguyên

.text
main: 
	# đọc số nguyên
	la $a0,prompt
	jal PromptInt
	move $s0, $v0
	
	#In
	#jal PrintNewLine
	la $a0, result
	move $a1, $s0
	jal PrintInt
	
	#Exit
	jal Exit
.data
	prompt: .asciiz "Nhap so nguyen: "
	result: .asciiz "Ket qua: "
.include "utils.asm"
.include "Bai5_1.asm"
