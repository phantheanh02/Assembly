# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.2 tuần 4
# Xây dựng một chương trình phát hiện tràn số trong phép cộng
	# Trong đó, khi 2 toán hạng cùng dấu thì tràn số sẽ xảy ra nếu dấu của tổng không cùng dấu với hai toán hạng
.data
input1: .asciiz "Nhap so hang thu nhat: "
input2: .asciiz "Nhap so hang thu hai: "
output: .asciiz "Ket qua (1 - tran so; 0 - khong tran so) : "
.text
# Nhập 2 số a và b
	# Nhập a
	ori $v0, $zero, 4
	la $a0,input1
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0,$v0
	# Nhập b
	ori $v0, $zero, 4
	la $a0,input2
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s1,$v0
	
# Kiểm tra tràn số
	
	ori $v0, $zero, 4
	la $a0,output
	syscall
	
	sra $s0,$s0,31
	sra $s1,$s0,31
	
	ori $v0, $zero, 1
	and $a0,$s0,$s1
	syscall
# End
	ori $v0, $zero,10
	syscall
