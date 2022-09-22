# Phan Thế Anh - 20204941
# 30/5/2022
# Bài tập 7.4
# Đếm độ dài của một chuỗi 
.data
string: .asciiz "hello world"
.text
main:
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
	move $a0, $s0
	li $v0, 1
	syscall