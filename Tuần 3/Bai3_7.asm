# Phan Thế Anh - 20204941
# Lớp: 130997
# 18/4/2022
# Bài 3.7 tuần 3

# Sửa lỗi 1: chuyển .ascii --> .asciiz
# Sửa lỗi 2: in ra số 4, sử dụng li $v0,1 để in ra số nguyên
.data
result1: .asciiz "\nFirst value = "
result2: .asciiz "\nSecond value = "

.text
main:
# In ra result1
	li $v0,4
	la $a0,result1
	syscall
# In ra số 4
	li $v0,1
	li $a0,4
	syscall
# In ra result2
	li $v0,4
	la $a0,result2
	syscall 
# In ra số 8
	li $v0,1
	li $a0,8
	syscall
# Thực hiện phép cộng
# Exit
	addi $v0,$zero,10
	syscall	