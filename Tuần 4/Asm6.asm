# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.6 tuần 4
# Thực hiện phép NAND
.data
input1: .asciiz "Nhap so nguyen: "
input2: .asciiz "So nguyen duoi dang nhi phan:\t"
output: .asciiz "\nNAND với 0x12345678:\t\t"
.text
# Nhập số nguyên
	ori $v0, $zero, 4
	la $a0,input1
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
# Đổi số nguyên sang nhị phân	
	ori $v0, $zero, 4
	la $a0,input2
	syscall
	
	ori $v0, $zero, 35
	move $a0,$s0
	syscall
# Thực hiện NAND
	ori $v0, $zero, 4
	la $a0,output
	syscall
	addi $a0,$s0,0x12345678
	not $a0,$a0
	ori $v0, $zero, 35
	syscall
# End 
	ori $v0, $zero, 10
	syscall
	 