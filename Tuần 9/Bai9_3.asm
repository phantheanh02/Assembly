# Phan Thế Anh - 20204941
# 13/6/2022
# Bài tập 9.3
# Tính n!

.text
main:	
	jal Warp
print:
	add $a1, $v0, $zero
	li $v0, 56
	la $a0, Message
	syscall
	jal Exit
endmain:

# Procepure Warp: 
Warp:
	sw $fp, -4($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	
	li $a0, 5
	jal Fact
	nop
	
	lw $ra, 0($sp)
	addi $sp, $fp, 0
	lw $fp, -4($sp)
	jr $ra
wrap_end:
# Subprogram: Fact
# Purpost: tính n!
# Input: a0 - n
# Ouput: v0 - n!
Fact:
	sw $fp, -4($sp)
	addi $fp, $sp, 0
	addi $sp, $sp, -12
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0, $a0, 2
	beq $t0, $zero, recursive
	nop
	li $v0, 1
	j done
recursive:
	addi $a0, $a0, -1
	jal Fact
	nop
	lw $v1, 0($sp)
	mult $v1, $v0
	mflo $v0
done:
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $fp,0
	lw $fp, -4($sp)
	jr $ra 
.data
Message: .asciiz "Result: "
.include "utils.asm"