# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.8
# Chương trình nhác người dùng nhập vào 3 số
# Tìm giá trị trung bình

.text
main:
	jal Avg
	move $a1, $v0
	la $a0, avg
	jal PrintInt
	jal Exit
Avg:
	# Lưu $ra
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	# Nhập a
	la $a0, input
	jal PromptInt
	move $s0, $v0
	# Nhập b
	la $a0, input
	jal PromptInt
	move $s1, $v0
	# Nhập c
	la $a0, input
	jal PromptInt
	move $s2, $v0
	# Tính avg
	add $v0, $s0, $zero
	add $v0, $v0, $s1
	add $v0, $v0, $s2
	div $v0, $v0, 3
	# Return
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
.data
avg: .asciiz "Avg = "
input: .asciiz "Enter number: "
.include "utils.asm"