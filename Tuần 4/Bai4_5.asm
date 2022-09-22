# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Bài tập 4.5 tuần 4

.text
	li $s0, 0x0563 
	# gán thanh ghi $s0 có giá trị 0x0563
	
	andi $t0, $s0, 0xff 
	# thực hiện phép and  giữa $s0 với giá trị tức thì 0xff. $t0 = $s0 AND 0xff
	
	addi $t1,$s0,0x0400 
	# thực hiện phép and giữa $s0 với giá trị tức thì 0x0400. $t1 = $s0 AND 0x0400
	
	