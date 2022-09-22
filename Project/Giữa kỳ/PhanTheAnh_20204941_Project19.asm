# Phan Thế Anh
# MSSV: 20204941
# Project 1.19: Write a program that input some variable names. Check if variable names consist only 
# of English letters, digits and underscores and they can't start with a digit

# Input: Độ dài biến, tên biến
# Output: True/False

.text
Begin:
# Lấy độ dài tối đa của biến
	# Thông báo 
	la $a0, MaxString
	jal PromptInt
# Nhập tên biến từ người dùng
	la $a0, Input		# Thanh ghi $a0 chứa địa chỉ của biến Input
	addi $a1, $v0, 2	# Thanh ghi $a1 chứa chiều dài của biến
	jal PromptString	# Trả về địa chỉ của chuỗi người dùng nhập vào
	move $s0, $v0		# Chuyển địa chỉ của chuỗi người dùng nhập vào vào thanh ghi $s0
	addi $s1, $0, 0		# Chứa chỉ số kí tự đang xét 
# Kiểm tra phần tử là các chữ cái hoặc kí tự "_"
	lb $t0, 0($s0)		# Lấy kí tự đầu tiên
Check:
	beq $t0, '_', CheckNumber	# Kiểm tra có phải kí tự "_"  hay không
	# Kiểm tra A < t0 < Z
	sge $t1, $t0, 'A'	# if t0 > A then b t1 = 1 else t1 = 0
	sle $t2, $t0, 'Z'	# if t0 < Z then b t2 = 1 else t2 = 0
	and $t1, $t1, $t2	# t1 = t1 AND t2
	bnez $t1, CheckNumber	# if t1 != 0 then jump CheckNumber
	# Kiểm tra a< t0 < z
	sge $t1, $t0, 'a'	# if t0 > a then b t1 = 1 else t1 = 0
	sle $t2, $t0, 'z'	# if t0 < Z then b t2 = 1 else t2 = 0
	and $t1, $t1, $t2	# t1 = t1 AND t2
	bnez $t1, CheckNumber 	# if t1 != 0 then jump CheckNumber
	j False
# Kiểm tra các kí tự có là số hay không?
 CheckNumber:
 	# Kí tự tiếp theo
	addi $s1, $s1, 1	# Lấy chỉ số của kí tự tiếp theo
	add $t5, $s1, $s0	# Địa chỉ của kí tự tiếp theo\
	lb $t0, 0($t5)		# Lấy kí tự
	# Kiểm tra điều kiện dừng
	beq $t0, '\n', True 	# if t0 == '\n' then end check
	# Kiểm tra 0 < t0 < 9
	sge $t1, $t0, '0'	# if t0 > '0' then b t1 = 1 else t1 = 0
	sle $t2, $t0, '9'	# if t0 < '9' then b t2 = 1 else t2 = 0
	and $t1, $t1, $t2	# t1 = t1 AND t2
	bnez $t1, CheckNumber 	# if t1 != 0 then jump CheckNumber
	j Check			
EndCheck:
True:	# Print TRUE nếu biến thỏa mãn
	la $a0, Yes
	li $v0, 55
	syscall
	j End
False: 	# Print False nếu biến vi phạm
	la $a0, No
	li $v0, 55
	syscall
	j End
End:
	# Đưa ra yêu cầu hỏi người dùng có muốn tiếp tục hay không?
	la $a0, Return
	li $v0, 50
	syscall
	beqz $a0, Begin		# Nếu người dùng nhập vào là 0 thì quay lại chương trình
				# nếu là kí tự khác thì kết thúc chương trình
	# In ra lời cảm ơn và Exit
	la $a0, Finish
	la $a1, Thanks
	li $v0, 59
	syscall
	jal Exit
.data
Input: .asciiz "Enter the variable name: "
Yes: .asciiz "\nTrue!!\n"
No: .asciiz "\nFalse!!\n"
MaxString: .asciiz "Enter max length of variable (value is integer): "
Return: .asciiz "\nAre you want to return? "
Thanks: .asciiz "Thanks for using my program!!!"
Finish: .asciiz "Program End!!\n"
.include "utils.asm"
