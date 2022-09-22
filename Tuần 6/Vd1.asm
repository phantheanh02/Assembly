# Ví dụ 1
# Câu lệnh if đơn giản

.data
	num: .word 5
	PositiveNumber: .asciiz "Number is positive "
.text
	# if num > 0
	lw $t0, num
	sgt $t1, $t0, $zero
	beqz $t1, end_if
	
	la $a0, PositiveNumber
	li $v0, 4
	syscall
	
	end_if: 
	jal Exit
.include "utils.asm"