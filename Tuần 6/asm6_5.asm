# Phan Thế Anh - 20204941
# 16/5/2022
# Assigment 6.5
# Câu lệnh switch/case

.data 
test: .word 1
newline: .asciiz " "
.text
	la $s0, test 	# Gắn địa chỉ $s0 là địa chỉ của test
	lw $s1, 0($s0) 	# Gán $s1 = test[0]
	li $t0, 0 	# Tạo case 1
	li $t1, 1	# Tạo case 2
	li $t2, 2	# Tạo case 3
	beq $s1,$t0, case_0
	beq $s1,$t1, case_1
	beq $s1,$t2, case_2
	j default
case_0: 
	addi $s2, $s2, 1	# a = a + 1
	j continue
case_1:
	sub $s2, $s2, $t1	# a = a - 1
	j continue
case_2: 
	add $s3, $s3, $s3	# b = b + b
	j continue
default:
continue:
	move $a0, $s2
	li $v0, 1
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	
	move $a0, $s3
	li $v0, 1
	syscall
Exit:
	li $v0, 10
	syscall