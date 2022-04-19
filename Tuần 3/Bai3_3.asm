# Phan Thế Anh - 20204941
# Lớp: 130997
# 18/4/2022
# Bài tập 3.3 tuần 3

.text
# Gán giá trị cho X,Y
	addi $t1,$zero, 4 	# X=$t1=4
	addi $t2,$zero, 5	# Y=$t2=5
# Thực hiện Z= 3XY
	mul $s0,$t1,$t2		# $s0= XY
	mul $s0,$s0,3		# S0 = S0 * 3 = 3XY
# Z' = Z
	mflo $s1
# Điều bất thường: Khi thực hiện phép mul $s0,$s0,3 , máy thực hiện thêm một phép cộng để gán giá trị tức thời vào 1 thanh ghi, sau đó thực hiện phép nhân 2 thanh ghi