# Phan Thế Anh - 20204941
# 30/5/2022
# Bài tập 7.7
# Viết một chương trình cho phép người dùng đoán
# 	một số ngẫu nhiên do máy tính tạo ra từ 1 đến cực
# 	đại (người dùng nhập giá trị lớn nhất để đoán)

.data
max: .asciiz "Gia tri lon nhat: "
hoi: .asciiz "Nhap so cua ban: "
win: .asciiz "Ez game!!"
lonhon: .asciiz "So to qua!!\n"
nhohon: .asciiz "So nho qua!!\n"

.text
	# Lấy max từ người dùng
	li $v0, 4
	la $a0, max
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Tạo số ngẫu nhiên
	li $v0, 42
	li $a0, 1
	move $a1, $s0
	syscall 
	move $s1, $a0
	
	# Bắt đầu chơi
Round:
	# Số của người chơi
	li $v0, 4
	la $a0, hoi
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	# Kiểm tra kết quả
	beq $s2,$s1,End_round
	bgt $s2,$s1, Greater
	blt $s2, $s1, Less
Greater:
	li $v0, 4
	la $a0, lonhon
	syscall
	j Round
Less:
	li $v0, 4
	la $a0, nhohon
	syscall
	j Round
End_round:
	li $v0, 4
	la $a0, win
	syscall
Exit:
	li $v0, 10
	syscall
	
