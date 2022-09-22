# Phan Thế Anh -- 20204941
# 6/6/2022
# Bài tập 8.3

# Do tất cả các nhóm đều bắt đầu từ 0x10010000
# nên trước khi $a0 lấy địa chỉ bắt đầu của thanh ghi $t0
# thì cần phải nạp giá trị 0x1001 vào 16 bit cao
# Trong ví dụ là nạp giá trị 1001 ( không chia hết cho 4)
# mà phần .data có khai báo dạng .word ( nhóm từ chiếm 4 byte)
# nên giá trị 1001 không thuộc ranh giới từ --> lỗi
# Sửa thay 1001 --> 1000 or 0x1001
.text 
	lui $t0, 1001
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	 li $v0, 10
	 syscall
.data
	.word 8 