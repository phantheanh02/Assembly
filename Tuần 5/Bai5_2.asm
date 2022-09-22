# Phan Thế Anh - 20204941
# 9/5/2022
# Bài tập 5.2

# Vấn đề: trước khi bắt đầu một chương trình con mới, người lập trình đã không khai báo nhãn .text
# khiến hệ thống hiểu nhầm là khai báo biến
# Giải quyết: Thêm nhãn .text trước Printtab
# Hàm thực hiện một lệnh tab, khai báo biến hàm chưa đúng quy ước

# Subprogram: PrintNewLine
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
	
.text
	li $v0, 4
	la $a0, __PNL_tab
	syscall
	jr $ra
.data
	__PNL_tab: .asciiz "\t"