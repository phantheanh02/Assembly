# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.4 tuần 4
# Thực hiện thao tác bit Bù(NOT) của một số nguyên

.data
input1: .asciiz "Nhap so nguyen: "
input2: .asciiz "So nguyen duoi dang nhi phan:\t"
output: .asciiz "\nKet qua duoi dang nhi phan:\t"
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
# Thực hiện NOT và in kết quả
	ori $v0, $zero, 4
	la $a0,output
	syscall
	
	ori $v0, $zero, 35
	xori $a0,$s0,0xffffffff
	syscall
# End
	ori $v0, $zero,10
	syscall