# Phan Thế Anh - 20204941
# Lớp: 130997
# 25/4/2022
# Bài tập 4.6 tuần 4

addiu $t0, $zero, 60000
ori $t0, $zero, 60000
# Sự khác nhau:
	# Lệnh addiu là giả lệnh gồm 3 lệnh
	# Lệnh ori là lệnh thực
# Kết quả có giống nhau
# Lệnh ori chạy nhanh hơn
	# Vì lệnh addiu còn phải thực hiện sao chép giá trị tức thời sang thanh ghi tạm thời, sau đó mới thực hiện phép cộng
