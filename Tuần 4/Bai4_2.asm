# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Bài tập 4.2 tuần 4
# Nhập vào một số nguyên
# Thực hiện các phép dịch bit trái,phải,số học, vòng một số bit giống nhau

.data
NhapSo: .asciiz "\nNhap 1 so nguyen: "
SoBit: .asciiz "\nSo bit can dich: "
DichTrai: .asciiz "\nDich Trai:\t\t"
DichPhai: .asciiz "\nDich Phai:\t\t"
SoHocTrai: .asciiz "\nSo Hoc Trai:\t\t"
SoHocPhai: .asciiz "\nSo Hoc Phai:\t\t"
VongPhai: .asciiz "\nVong Phai:\t\t"
VongTrai: .asciiz "\nVong Trai:\t\t"

.text
# Nhập số nguyên
	ori $v0,$zero,4
	la $a0,NhapSo
	syscall

	ori $v0,$zero,5
	syscall
	move $s0,$v0
# Số bit cần dịch
	ori $v0,$zero,4
	la $a0,SoBit
	syscall

	ori $v0,$zero,5
	syscall
	move $s1,$v0
# Thực hiện phép dịch trái
	ori $v0,$zero,4
	la $a0,DichTrai
	syscall
	
	ori $v0,$zero,35
	sllv $a0,$s0,$s1
	syscall
# Thực hiện phép dịch phải
	ori $v0,$zero,4
	la $a0,DichPhai
	syscall
	
	ori $v0,$zero,35
	srlv $a0,$s0,$s1
	syscall
# Thực hiện phép dịch số học phải
	ori $v0,$zero,4
	la $a0,SoHocPhai
	syscall
	
	ori $v0,$zero,35
	srav $a0,$s0,$s1
	syscall
# Thực hiện dịch vòng trái
	ori $v0,$zero,4
	la $a0,VongTrai
	syscall
	
	ori $v0,$zero,35
	rol $a0,$s0,$s1
	syscall
# Thực hiện dịch vòng trái
	ori $v0,$zero,4
	la $a0,VongPhai
	syscall
	
	ori $v0,$zero,35
	ror $a0,$s0,$s1
	syscall
# End
	ori $v0,$zero,10
	syscall