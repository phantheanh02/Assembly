# Program 5.5
# Cách trả về giá trị từ chương trình con

.text
main:
	# Đọc giá trị vào
	la $a0,prompt
	jal PromptInt
	move $s0,$v0
	# In
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

# Subprogeam: PromptInt
# Author: 
# Purpose: In cho người dùng nhập 1 số nguyên và trả lại giá trị đó
# Input: $a0 - địa chỉ chuỗi cần in
# Return: $v0 - giá trị người dùng nhập vào
# Side effects: chuỗi + số được in ra màn hình
.text
PromptInt:
	# In chuỗi
	li $v0,4
	syscall
	# Đọc số nguyên từ người dùng
	
	li $v0,5
	syscall
	#return
	jr $ra
# Hàm Exit
.text
	Exit:
	li $v0,10
	syscall	