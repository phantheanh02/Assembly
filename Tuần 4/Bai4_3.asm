# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Bài tập 4.3 tuần 4
# Dịch các lệnh sang mã máy
.text
.globl main
main:
	ori $t0,$zero,15	# 0x3408000f
	ori $t1,$zero,3		# 0x34090003
	add $t1,$zero,$t1	# 0x00094820
	sub $t2,$t0,$t1		# 0x01095022
	sra $t2,$t2, 2		# 0x000a5083
	mult $t0,$t1		# 0x01090018
	mflo $a0		# 0x00002012
	ori $v0,$zero,1		# 0x34020001
	syscall			# 0x0000000c
	addi $v0,$zero,10	# 0x2002000a
	syscall			# 0x0000000c
.data
result: .asciiz "15*3 is"