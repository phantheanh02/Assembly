# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Bài tập 4.1 tuần 4
# Viết chương trình nhập vào 2 số nguyên a và b
# In ra màn hình 2 số nguyên dưới dạng hexa
# Thực hiện phép toán a XOR b và in ra kết quả
# XOR kết quả với b và in ra kết quả

.data
nhapA: .asciiz "\nNhap so nguyen a: "
nhapB: .asciiz "\nNhap so nguyen b: "
output1: .asciiz "\nSo a: "
output2: .asciiz "\nSo b: "
output3: .asciiz "\na XOR b: "
output4: .asciiz "\na XOR b XOR b: "

.text
# Nhập a
	ori $v0,$zero,4
	la $a0,nhapA
	syscall
	
	ori $v0,$zero,5
	syscall
	move $s0,$v0
# Nhập b
	ori $v0,$zero,4
	la $a0,nhapB
	syscall
	
	ori $v0,$zero,5
	syscall
	move $s1,$v0
# In ra a dưới dạng hexa
	ori $v0,$zero,4
	la $a0,output1
	syscall
	
	ori $v0,$zero,34
	move $a0,$s0
	syscall
# In ra b dưới dạng hexa
	ori $v0,$zero,4
	la $a0,output2
	syscall
	
	ori $v0,$zero,34
	move $a0,$s1
	syscall
# Thực hiện phép a XOR b
	ori $v0,$zero,4
	la $a0,output3
	syscall
	
	ori $v0,$zero,34
	xor $s2,$s0,$s1
	move $a0,$s2
	syscall
# Thực hiện phép a XOR b XOR b
	ori $v0,$zero,4
	la $a0,output4
	syscall
	
	ori $v0,$zero,34
	xor $a0,$s2,$s1
	syscall
# Kết thức chương trình
	ori $v0,$zero,10
	syscall