# Phan Thế Anh - 20204941
# 16/5/2022
# Assigment 6.4
# Tính tổng của mảng

.data
A: .word 1,2,3,4,0,5
.text
	li $s1, -1 # i
	li $s4, 1 # step
	li $s3, 5 # n
	la $s2, A # Address of A[i]
loop:
	add $s1, $s1, $s4	# i = i + step
	add $t1, $s1, $s1	# t1 = 2 * s1
	add $t1, $t1, $t1	# t1 = 4 * s1
	add $t1, $t1, $s2	#  t1 store the address of A[i] 
	lw $t0, 0($t1)		# load value of A[i] in $t0
	add $s5, $s5, $t0	# sum = sum + A[i]
# return loop if i < n
	# slt $t5, $s1, $s3
	# bnez $t5, loop
# i <= n
	# sgt $t5, $s1, $s3
	# beqz $t5, loop
# sum >= 0	
	# slt $t5, $s5,$zero
	# beqz $t5, loop
# A[i] == 0
	beqz $t0, loop
# Print sum
	li $v0, 1
	move $a0, $s5
	syscall