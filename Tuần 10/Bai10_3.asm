# Phan Thế Anh - 20204941
# 20/6/2022
# Bài tập 10.3
# Thực hiện Bubble Sort và in ra mảng
# với kích thước người dùng nhập vào
# và điền các số ngẫu nhiên

.text
# Lấy kich thước bảng
	la $a0, KichThuoc
	jal PromptInt
	move $s0, $v0		# s0 - Kích thước
# Lấy các phần tử
	move $s1, $zero		# s1 - Đếm số phần tử
			
	move $a0, $s0
	li $a1, 4
	jal AllocateArray
	move $s2, $v0		# s2 - chứa địa chỉ của mảng
lap:
	# Kiểm tra điểu kiện
	beq $s0, $s1, end_lap 
	sll $t0, $s1, 2
	add $t0, $t0, $s2
	la $a0, NhapSo
	jal PromptInt
	move $t1, $v0
	sw $t1, 0($t0)
	addi $s1, $s1, 1
	b lap
end_lap:
	# Sắp xếp
	add $a0, $s2, $zero
	move $a1, $s0
	jal BubbleSort
	# In
	add $a0, $s2, $zero
	move $a1, $s0
	jal PrintIntArray
	
	# Exit
	jal Exit

.data
KichThuoc: .asciiz "Nhap kich thuoc mang: "
NhapSo: .asciiz "Nhap so: "
.include "utils.asm"
	
	
