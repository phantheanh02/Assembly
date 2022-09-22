# Phan Thế Anh - 20204941
# 9/5/2022
# Bài tập 5.1

# Subprogram: PrintInt
# Author:
# purpost: To print a string to the console
# Input: $a0 - The address of the string to print
#	 $a1 - The value of the int to print
# return: none
# side effects; ....

# a) Lỗi trong chương trình: chương trình con PrintInt đã gọi 1 chương trình con khác PrintNewLine
# b) Khi gọi hàm PrintNewLine, thanh ghi $ra đã lưu địa chỉ của lệnh tiếp theo là lệnh jr $ra
# nên khi hàm PrintNewLine kết thục đến lệnh jr $ra trả về địa chỉ chính nó --> lặp vô hạn
# c) Giải pháp: 
# C1: viết trực tiếp hàm con PrintNewLine ( không sử dụng lệnh jal PrintNewLine)
# C2: Lưu giá trị $ra trước khi gọi hàm PrintNewLine
.text
PrintInt1:
	# In chuỗi
	li $v0, 4
	syscall
	
	# In số 
	move $a0, $a1
	li $v0,1
	syscall
	
	# Lưu địa chỉ $ra
	move $t0,$ra
	# In ra 1 dòng mới
	jal PrintNewLine
	move $ra, $t0
	# return
	jr $ra
	