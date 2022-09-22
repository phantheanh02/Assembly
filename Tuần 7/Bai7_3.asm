# Phan Thế Anh - 20204941
# 30/5/2022
# Bài tập 7.3

.data
x: .space 1000
y: .asciiz "Tong cua   va   la: "

.text
	la $a1,y
	la $a0,x
	li $s0, 9
	li $s1, 2
strcpy:
	add $s3,$zero, $zero	# s3 = i = 0
L1:
	add $t1, $s3, $a1	# t1 = s0 + a1 = i + y[0] = address of y[i]
	lb $t2, 0($t1)		# t2 = value of y[i]
	add $t3, $s3, $a0	# t3 = i + x[0] = address of x[i]
	sb $t2, 0($t3)		# x[i] = t2 = y[i]
	beq $s3, 9, s0
	nop
	beq $s3, 14, s1
	nop
	beq $t2, $0, end_of_strcpy
	nop
	addi $s3, $s3, 1	# i = i++
	j L1
	nop
	
s0: 	
	addi $t2, $t2, 25
	sb $t2, 0($t3)
	addi $s3, $s3, 1	# i = i++
	j L1
s1: 
	addi $t2, $t2, 18
	sb $t2, 0($t3)
	addi $s3, $s3, 1	# i = i++
	j L1	
end_of_strcpy:
	la $a0, x
	li $v0, 4
	syscall
	
	add $a0, $s0, $s1
	li $v0, 1
	syscall
	
	