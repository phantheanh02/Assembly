# Ví dụ 5.1
# Nhắc người dùng nhập vào 1 số nguyên và in ra màn hình

.text
	# Đọc giá trị từ đầu vào
	li $v0,4
	la $a0,prompt
	syscall
	li $v0,5
	syscall
	move $s0,$v0
	
	# In giá trị ra màn hình
	li $v0, 4
	la $a0, result
	syscall
	li $v0,1
	move $a0, $s0
	syscall
	
	# gọi hàm exit
	jal Exit
	
.data
	prompt: .asciiz "Nhap so nguyen: "
	result: .asciiz "\nKet qua: "
.text
Exit:
	li $v0,10
	syscall