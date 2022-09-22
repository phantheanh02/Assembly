# Program 5.4 - truyền nhiều tham số
# in một dòng nhắc người dùng những gì sẽ được in ra, và sau đó in ra số nguyên.

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
	move $a1, $s0
	jal PrintInt
	
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
	
# Subprogeam: PrintInt
# Author: 
# Purpose: In 1 chuỗi từ input
# Input: $a0 - địa chỉ chuỗi cần in
#	 $a1 - giá trị cần in
# Return: none
# Side effects: chuỗi + số được in ra màn hình
.text
PrintInt:
	# In chuỗi
	li $v0,4
	syscall
	# In số
	move $a0,$a1
	li $v0,1
	syscall
	#return
	jr $ra
# Hàm Exit
.text
	Exit:
	li $v0,10
	syscall		
