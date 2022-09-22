# Phan Thế Anh - 20204941
# 30/5/2022
# Bài 7.6
# Người dùng nhập vào 1 chuỗi
# Kết thúc khi nhấn enter or length > 20
# In chuỗi ngược lại

.data
message: .asciiz "Please input a string: "
string: .space 21
Rstring: .space 21
output: .asciiz "Reverse string:\n"
.text
 	# Yêu cầu người dùng nhập vào chuỗi từ hộp thoại
	li $v0, 54
	la $a0, message
	la $a1, string
	la $a2, 20
	syscall
	
	# Lấy độ dài
get_length:
	la $a0, string		# a0 = address string[0]
	xor $s0, $0, $0		# s0 = length = 0
	xor $t0, $0, $0		# t0 = i =0
check_char:
	add $t1, $a0, $t0	# t1 = a0 + t0
				# = address string[0] + i
	lb $t2, 0($t1)		# t2 = string[i]
	beq $t2, $0, end_if_str	# is null?
	addi $s0, $s0, 1	# length++
	addi $t0, $t0, 1	# i++
	j check_char
end_if_str:
	subi $s0,$s0,1
	# Copy chuỗi ngược
	la $a1,string
	la $a0,Rstring
strcpy:
	add $s3,$0, $zero	# s3 = i = length(string)
L1:
	add $t1, $s3, $a1	# t1 = s0 + a1 = i + y[0] = address of y[i]
	lb $t2, 0($t1)		# t2 = value of y[i]
	add $t3, $s0, $a0	# t3 = j + x[0] = address of x[j]
	sb $t2, 0($t3)		# x[j] = t2 = y[i]
	beq $s0, $0, end_of_strcpy
	nop
	subi $s0, $s0, 1	# i++
	addi $s3, $s3, 1	# j--
	j L1
	nop	
end_of_strcpy:
	# In
	li $v0, 59
	la $a0, output
	la $a1, Rstring
	syscall
	