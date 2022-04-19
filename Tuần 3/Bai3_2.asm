# Phan Thế Anh - 20204941
# Lớp: 130997
# 18/4/2022
# Bài tập 3.2 tuần 3

.text
# Thực hiện gán
	addi	$t1,$zero, 5 	# gán X=$t1=5
	addi	$t2,$zero, -1	# gán Y=$t2=-1
# Thực hiện phép cộng	
	add $s0,$t1,$t1		# $s0 = X+X = 2X = 10
	add $s0,$s0,$t2		# $s0= $s0 + Y = 2X + Y = 9