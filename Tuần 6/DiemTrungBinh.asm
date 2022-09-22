# Phan Thế Anh - 20204941
# 16/5/2022
# Chương trình tính điểm trung bình
# Input: điểm số từ người dùng 
# Ouput: Điểm trung bình và điểm chữ

.data
Input: .asciiz "Nhap diem (-1 de ket thuc): "
Output1: .asciiz "Diem trung bình = "
Output2: .asciiz "\nDiem chu "

.text
# Nhập điểm đến khi kết thúc
	li $s0, 0 # Sum
	li $s1, 0 # Đếm
	la $a0, Input
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
NhapDiem:
	add $s0, $s0, $t0	# sum = sum + số
	addi $s1, $s1, 1	# dem = dem + 1
	la $a0, Input
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	bne $t0, -1, NhapDiem

# In ra điểm trung bình
	li $v0, 4
	la $a0, Output1
	syscall
	
	
	