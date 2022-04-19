# Ví dụ 3.4 Tuần 3
# Phép chia và độ chính xác của phép chia
# Tính 10/3*3 và 10*3/3 

.data
	result1: .asciiz "\n(10/3)*3 = "
	result2: .asciiz "\n(10*3)/3 = "

.text
.globl main
main: 
	addi $s0,$zero,10
	addi $s1,$zero,3
	
	div $s2,$s0,$s1
	mul $s2,$s2,$s1
	
	addi $v0,$zero,4
	la $a0,result1
	syscall
	
	addi $v0,$zero,1
	move $a0,$s2
	syscall
	
	mul $s2,$s0,$s1
	div $s2,$s2,$s1
	
	addi $v0,$zero,4
	la $a0,result2
	syscall
	
	addi $v0,$zero,1
	move $a0,$s2
	syscall
	
	addi $v0,$zero,10
	syscall