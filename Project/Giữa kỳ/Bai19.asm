# Phan Thế Anh
# MSSV: 20204941
# Project 1.19: Write a program that input some variable names. Check if variable names consist only 
# of English letters, digits and underscores and they can't start with a digit

# Input: Độ dài biến, tên biến
# Output: True/False

.text
Begin:
# Kiểm tra độ dài của biến nhập vào có hợp lệ
	la $a0, MaxString
	li $a1, 100000
	jal PromptString
	move $s0, $v0
	addi $s1,$zero,0 	#i=0
	addi $s2,$zero,0 	#so can in ra (X)
	
chuyenso:
	add $t0,$s1,$s0 	#t1 = i + vi tri string ~> vi tri cua ky tu i dang tro den
	lb $t1,0($t0) 		#load 1 byte tu vi tri t0 vao t1 (t1 dang tro toi A[i], la 1 chuoi cac ky tu bat dau tu A[i], 
				# muon chi lay ra A[i] thi minh chi load 1 byte
	beq $t1, '\n' , Continue		#neu t1 = null thi ket thuc
#so sanh neu ky tu ngoai khoang '0' den '9' thi next
	sle $t3, $t1, '9' 	#neu t1<'0' thi t3=1
	sge $t2, $t1, '0' 	#neu '9'< t1 thi t2=1
	and $t3, $t3, $t2
	bne $t3, 1, False_Length 	#a0<'0' thi bo qua ky tu nay (de xet ky tu tiep)
	#beq $t2, 1, false 	#a0>'9' thi bo qua ky tu nay (de xet ky tu tiep)

	addi $t1,$t1,-48 	#chuyen tu ascii (48~57) ve gia tri so
	sll $t3, $s2, 1 	#t3=2x
	sll $t2, $s2, 3 	#t2=8x
	add $t2, $t3, $t2	#t2 = 2x + 8x = 10x
	add $s2,$t2,$t1		#x=10x+a0
next:
	addi $s1,$s1,1 		#++i
	j chuyenso 
Continue:
	addi $s2, $s2, 2	
# Nhập tên biến từ người dùng
	la $a0, Input		# Thanh ghi $a0 chứa địa chỉ của biến Input
	move $a1, $s2		# Thanh ghi $a1 chứa chiều dài của biến
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
False_Length:
	la $a0, Error
	li $v0, 55
	syscall
	j End
.data
Error: .asciiz "The length of string error!!\n"
Hint: .asciiz "The number of string is integer"
Input: .asciiz "Enter the variable name: "
Yes: .asciiz "\nTrue!!\n"
No: .asciiz "\nFalse!!\n"
MaxString: .asciiz "Enter max length of variable (value is integer): "
Return: .asciiz "\nAre you want to return? "
Thanks: .asciiz "Thanks for using my program!!!"
Finish: .asciiz "Program End!!\n"
.include "utils.asm"
