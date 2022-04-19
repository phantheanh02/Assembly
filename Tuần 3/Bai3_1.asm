# Phan Thế Anh - 20204941
# Lớp: 130997
# 18/4/2022
# Bài tập 3.1 tuần 3
.text 
	addi 	$s0,$zero, 0x3007
	add 	$s0,$zero, $0
# Ban đầu lệnh addi chỉ được phiên dịch thành lệnh addi
# Khi sửa lệnh addi $s0, $zero,0x2110003d thì lệnh addi được phiên dịch thành lệnh lui,ori và add ( Cộng với giá trị 32bits)