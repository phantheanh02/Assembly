# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.4
# Tìm phần tử lớn nhất trong 3 số nguyên
.data
output: .asciiz "max is "
.text
main: 
	li $a0, 2
	li $a1, 6
	li $a2, 1
	jal max
	nop
	la $a0, output
	move $a1, $v0
	jal PrintInt
endmain:
# Subprogram: max 
# Purpost:	find the largest of three integer
# Input:	$a0, $a1,$a2
# Output: 	$v0 the largest value
max: 
	add $v0, $a0, $zero	# v0 = a0
	sub $t0, $a1, $v0	# t0 = a1 - v0
	bltz $t0, okay		# if a1 - v0 < 0 then n change
	nop
	add $v0, $a1, $zero	# v0 = a1
okay:
	sub $t0, $a2, $v0	# t0 = a2 - v0
	bltz $t0, done
	nop
	add $v0, $a2, $zero
done: 	jr $ra
.include "utils.asm"
	
