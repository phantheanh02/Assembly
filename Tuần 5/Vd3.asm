# Ví dụ 5.3
# chương trình in ra một chuỗi
# chương trình con cần một tham số đầu vào

.text
main:
	# Đọc giá trị vào
	la $a0, prompt
	jal PrintString
	li $v0, 5
	syscall
	move $s0, $v0
	 
	# In ra màn hình
	jal PrintNewLine
	la $a0, result
	jal PrintString
	li $v0, 1
	move $a0, $s0
	syscall
	
	# Gọi Exit
	jal Exit
.data
	prompt: .asciiz "Nhap so nguyen: "
	result: .asciiz "Ket qua: "
	
# Chương trình con tạo dòng mới
# Input: none
# Output: none
# Side effects: In ra một dòng mới
.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"
 
# Subprogeam: PrintString
# Author: 
# Purpose: In 1 chuỗi từ input
# Input: $a0 - địa chỉ chuỗi cần in
# Return: none
# Side effects: chuỗi được in ra màn hình
.text
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra

# Hàm Exit
.text
	Exit:
	li $v0,10
	syscall	