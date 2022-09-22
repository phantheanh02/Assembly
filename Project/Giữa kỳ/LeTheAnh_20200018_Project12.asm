# Lê Thế Anh
# MSSV: 20200018
# Project 1.12: Write a function that converts a string of ASCII digits into a 32-bit integer. The function
# will receive as an argument the starting address of the string and must return a 32-bit
# integer containing the integer value of the string. Assume that the string is an ASCIIZ
# string, i.e., ends with the null character (ASCII code 0). You don't need to check for
# errors in the string, i.e., you may assume the string contains only characters '0' through
# '9' (i.e., their corresponding ASCII codes), and will not represent a negative number or
# a non-decimal value or too large a number. For example, a_to_i called with the
# argument "12345" will return the integer 12345

#Input: Yêu cầu người dùng nhập vào một số nguyên dương dạng chuỗi
#Output: In ra màn hình số đó dưới dạng só nguyên 32bit

.data
prompt: .asciiz "Please enter a 32bit positive integer! \n"
input1 : .asciiz "Enter your number: "
Input : .word 0:100
Output1: .asciiz "------------------------------------\nThe integer you just entered is: " 
Output2: .asciiz "\n32bit positive integer: " 
no: .asciiz "Error!!\nThe number you entered is too large or wrong, please re-enter! \n-------------------------------------\n"
.text
#------------------------------------------------------------------------
nhapso:
	li $v0, 4
	la $a0, prompt	# in ra prompt
	syscall

	li $v0, 4
	la $a0, input1	#in ra input1
	syscall
	
	la $a0, Input		#nhap chuoi so theo dang string
	li $a1,100 		#toi da 100 ky tu
	li $v0,8 		# syscall voi v0=8 ~> nhap string
	syscall
	addi $s0, $a0, 0	#luu vi tri string vao s0 ~ vi tri ky tu dau tien cua string
	addi $s1,$zero,0 	#i=0
	addi $s2,$zero,0 	#so can in ra (X)
#-----------------------------------------------------------------------	
chuyenso:
	add $t0,$s1,$s0 	#t0 = i + vi tri string ~> vi tri cua ky tu  thu i trong chuoi
	lb $t1,0($t0) 		#load 1 byte tu vi tri t0 vao t1 (t1 dang tro toi A[i], la 1 chuoi cac ky tu bat dau tu A[i], 
				# muon chi lay ra A[i] thi minh chi load 1 byte
	beq $t1,'\n' ,end 	#neu t1 = null thi ket thuc ( kiem tra dieu kien ket thuc chuoi )
#Kiem tra ki tu nhap vao co phai tu 1 -> 9 hay khong
	slti $t3, $t1, '0'	#neu t1<'0' thi t3=1
	sgt  $t2, $t1, '9'	#neu '9'< t1 thi t2=1
	or $t4,$t2,$t3		# Neu t3=1 or t2 =1 thì t4 = 1
	beq $t4,1,false		# Khi t4 = 1 nghĩa là nguoi dung nhap vao khong phai la mot so nguyen duong
#chuyen tu ascii (48~57) ve gia tri so 
	addi $t1,$t1,-48 	#chuyen tu ascii (48~57) ve gia tri so
	sll $t3, $s2, 1 	#t3=2x
	sll $t2, $s2, 3 	#t2=8x
	add $t2, $t3, $t2	#t2 = 2x + 8x = 10x
	add $s2,$t2,$t1		#x=10x+a0
	sgt $t5, $s2, 0xFFFFFFFF	# nếu X > 2^31 thì set $t5 = 1
	beqz $t5, false
	
next:
	addi $s1,$s1,1 		#++i
	j chuyenso
	 
end:
	li $v0, 4
	la $a0, Output1 	# in ra output1	
	syscall
	
	li $v0, 1		#in ra X là số nguyên
	addi $a0,$s2,0  
	syscall
	
	li $v0, 4
	la $a0, Output2 	# in ra output2
	syscall
	
	li $v0,35 		#in dang so nguyen thap phan 32 bit
	addi $a0,$s2,0
	syscall
	j exit
	
false:	# Nếu sai thì  nhập lại
	la $a0, no
	li $v0, 4
	syscall
	j nhapso
	
exit:
	li $v0,10
	syscall

