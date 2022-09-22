# Ví dụ 5.2
# in một ký tự dòng mới, cho phép  chương trình chèn ký tự điều khiển "\n" vào chương trình.

.text
main: 
	# Đọc giá trị đầu vào
	li $v0,4
	la $a0, prompt
	li $v0,5
	syscall
	move $s0,$v0
	
	# In giá trị ra màn hình
	jal PrintNewLine
	li $v0, 4
	la $a0, result
	syscall
	li $v0,1
	move $a0, $s0
	syscall
	
	# Gọi Exit
	jal Exit
# Khai báo biến
.data
	prompt: .asciiz "Nhap so nguyen: "
	result: .asciiz "\nKet qua: "
# Khai báo hàm con PrintNewLine
# Input: none
# Outpur: \n
# Side effects: chèn kí tự "\n"
.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"
# Hàm Exit
.text
	Exit:
	li $v0,10
	syscall	