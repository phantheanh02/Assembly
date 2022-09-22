# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.5
# Mô tả các thao tác push và pop với ngăn xếp
# Hoán đổi giá trị s0 và s1

.text
	la $a0, a
	jal PromptInt
	move $s0, $v0
	
	la $a0, b
	jal PromptInt
	move $s1, $v0
push: 
	addi $sp, $sp, -8
	sw $s0, 4($sp)
	sw $s1, 0($sp)
work:
	nop
	nop
	nop
pop:
	lw $s0,0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8

Print:
	la $a0, a
	move $a1, $s0
	jal PrintInt
	
	jal PrintNewLine
	la $a0, b
	move $a1, $s1
	jal PrintInt
	
	jal Exit
.data
a: .asciiz "a = "
b: .asciiz "b = "
.include "utils.asm"