# Phan Thế Anh - 20204941
# Lớp: 130997
# 18/4/2022
# Bài tập 3.9 Tuần 3

.data
TB1: .asciiz "\nNhap gia tri n (Luong khi): "
TB2: .asciiz "\nNhap gia tri T (Nhiet do): "
TB3: .asciiz "\nNhap gia tri P (Ap suat): "
KetQua: .asciiz "\V= "

.text
# Nhap du lieu
	li $v0,4
	la $a0,TB1
	syscall
	li $v0,5
	syscall
	move $s0,$v0
	
	li $v0,4
	la $a0,TB2
	syscall
	li $v0,5
	syscall
	move $s1,$v0
	
	li $v0,4
	la $a0,TB3
	syscall
	li $v0,5
	syscall
	move $s2,$v0

# Tính V
	li $v0,4
	la $a0,KetQua
	syscall
	
	li $v0,1
	mul $t0,$s0,$s1
	div $t0,$t0,$s2
	mul $t0,$t0,8314
	div $a0,$t0,1000
	syscall
# End
	li $v0,10
	syscall