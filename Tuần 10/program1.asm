# Phan Thế Anh - 20204941
# 20/6/2022
# Program 10.1
# Chương trình con PromptString

.text
main:
	la $a0, prompt1
	li $a1, 80
	jal PromptString
	move $a0, $v0
	jal PrintString
	
	la $a0, prompt2
	li $a1, 80
	jal PromptString
	move $a0, $v0
	jal PrintString
	
	jal Exit
.data
prompt1: .asciiz "Enter the first string: "
prompt2: .asciiz "Enter the second string: "
.include "utils.asm"
