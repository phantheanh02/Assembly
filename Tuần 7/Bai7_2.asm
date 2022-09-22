# Phan Thế Anh - 20204941
# 30/5/2022
# bài tập 7.2
# Chương trình hiển thị một chuỗi chào mừng
.data
test1: .asciiz "Hello "
test2: .asciiz "World"
.text
	li $v0, 59
	la $a0, test1
	la $a1, test2
	syscall