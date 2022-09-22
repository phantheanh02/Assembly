# Phan Thế Anh - 20204941
# 30/5/2022
# Bài tập 7.5
# Đếm độ dài của một chuỗi 
.data
message: .asciiz "Please input a string: "
string: .space 100
output: .asciiz "Length of string:\n"
.text
main:
	# Yêu cầu người dùng nhập vào chuỗi từ hộp thoại
	li $v0, 54
	la $a0, message
	la $a1, string
	la $a2, 100
	syscall
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
	li $v0, 56
	la $a0, output
	subi $a1, $s0, 1
	syscall
	