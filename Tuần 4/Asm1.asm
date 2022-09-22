# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.1 tuần 4
# Viết chương trình 
	# a) lấy bit MSB của $s0
	# b) xóa bit LSB của $s0
	# c) thiết lập bit LSB của @s0 ( bit 7 -> 0 về 1)
	# d) Xóa $s0 (s0 = 0, sử dụng lệnh logic)
.data
NhapSo: .asciiz "\nNhap so nguyen: "
So: .asciiz "\nSo nhi phan:\t\t "
BitMSB: .asciiz "\nBit MSB:\t\t "
BitLSB: .asciiz "\nXoa Bit LSB:\t\t "
output1: .asciiz "\nThiet lap bit LSB:\t\t "
output2: .asciiz "\nXoa $s0: \t\t\t"
.text
# Nhập số nguyên
	ori $v0, $zero, 4
	la $a0,NhapSo
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0,$v0
# In ra số dưới dạng hexa
	ori $v0, $zero, 4
	la $a0,So
	syscall
	
	ori $v0, $zero, 35
	move $a0,$s0
	syscall
# Lấy bit MSB
	ori $v0, $zero, 4
	la $a0,BitMSB
	syscall
	
	ori $v0, $zero, 35
	sra $a0,$s0,24
	syscall
#  Xóa bit LSB 
	ori $v0, $zero, 4
	la $a0,BitLSB
	syscall
	
	ori $v0, $zero, 35
	sra $a0,$s0,8
	syscall	
# Thiết lập bit LSB của $s0 về 1
	ori $v0, $zero, 4
	la $a0,output1
	syscall
	
	ori $v0, $zero, 35
	ori $a0,$s0,0x000000ff
	syscall	
# Xóa $s0
	ori $v0, $zero, 4
	la $a0,output2
	syscall
	
	ori $v0, $zero, 35
	xor $a0,$s0, $s0
	syscall
# End 
	ori $v0,$zero, 10
	syscall
	
