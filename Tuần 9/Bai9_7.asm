# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.6

.text
main:
	li $a0, 1
	li $a1, 2
	li $a2, 3
	li $a3, 4
	jal largesAndAverage
	
	move $s0, $v1
	move $a1, $v0
	la $a0, max
	jal PrintInt
	
	jal PrintNewLine
	
	move $a1, $s0
	la $a0, avg
	jal PrintInt
	
	jal Exit
endmain:

# Subprogram: largesAndAverage
# Purpost: Tìm giá trị lớn nhất và tính giá trị trung bình
# Input: a0,a1,a2,a3
# Output: v0 - max
#	  v1 - avg
largesAndAverage:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	move $s1, $a0
	move $s2, $a1
	move $s3, $a2
	move $s4, $a3
	# s0 = getLarget(s1,s2)
	move $a0, $s1
	move $a1, $s2
	jal getLarger
	move $s0, $v0
	# s0 = getLarget(s0,s3)
	move $a0, $s3
	move $a1, $s0
	jal getLarger
	move $s0, $v0
	# v0 = getLarget(s0,s4)
	move $a0, $s4
	move $a1, $s0
	jal getLarger
	
	# v1 = ( s1 + s2 + s3 + s4)/4
	add $v1, $s1, $s2
	add $v1, $v1, $s3
	add $v1, $v1, $s4
	div $v1, $v1, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
getLarger:
	add $v0, $a0, $zero
	sub $t0, $a1, $v0
	bltz $t0, done
	add $v0, $a1, $zero
done:
	jr $ra
.data
max: .asciiz "max is "
avg: .asciiz "avg is "
.include "utils.asm"
	
	