# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Assigment 4.7 tuần 4
# Thực hiện nhân một số nguyên với 10 chỉ dùng dịch bit và cộng
# Kiểm tra độ chính xác với mult và mflo

.data
input1: .asciiz "Nhap so nguyen: "
output1: .asciiz "KQ1 (Dung dich bit va cong) =\t"
output2: .asciiz "\nKQ2 (Dung mult và mflo)=\t"

.text
# Nhập số nguyên
	ori $v0, $zero, 4
	la $a0,input1
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s1, $v0
# Thực hiện với toán tử cộng và dịch bit
	ori $v0, $zero, 4
	la $a0,output1
	syscall
	
	sll $a0,$s1,1
	sll $a1,$s1,3
	add $a0,$a0,$a1
	ori $v0, $zero, 1
	syscall
# Thực hiện phép nhân bằng toán tử mult và mflo
	ori $v0, $zero, 4
	la $a0,output2
	syscall
	
	ori $v0, $zero, 1
	ori $t0, $zero, 10
	mult $s1, $t0
	mflo $a0
	syscall

# End
	ori $v0, $zero, 10
	syscall
	