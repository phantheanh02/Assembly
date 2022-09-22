# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.5 tuần 4
# Thực hiệp phép bù 2
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
# Thực hiệp phép bù 2
	# Thực hiện NOT và in kết quả
	ori $v0, $zero, 4
	la $a0,output
	syscall
	
	ori $v0, $zero, 35
	xori $a0,$s0,0xffffffff
	addi $a0,$a0,0x00000001
	syscall
# End
	ori $v0, $zero,10