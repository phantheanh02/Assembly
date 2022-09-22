# Phan Thế Anh -- 20204941
# 6/6/2022
# Bài tập 8.2

a) Tại sao các lệnh "la label" luôn cần dịch thành 2 dòng mã giả?
	- Lệnh "la label" là lệnh lấy địa chỉ của nhãn
	- Do tất cả các nhóm đều bắt đầu từ 0x10010000 nên cần nạp 0x1001 vào 16bit cao, sử dụng lệnh lui
	- Sau đó so sánh 16 bit thấp với địa chỉ của nhãn, sử dụng lệnh ori
	- Khi đó, thanh ghi đích sẽ chứa địa chỉ của nhãn ( không vi phạm ranh giới)
b) Lệnh "lw label"
	- Lệnh "lw label" láy giá trị tại địa chỉ offset của nhãn
	- B1: nạp 0x1001 vào 16 bit cao
	- B2: lấy giá trị tại offset(địa chỉ bắt đầu nhãn)
c) So sánh sự giống và khác nhau
* Giống nhau:
	- Đều là mã giả 
	- Đều nạp giá trị 0x1001 vào 16 bit cao đầu tiên
* Khác nhau:
	# lw
	Lấy giá trị tại offset của địa chỉ nhãn
	# la
	Lấy địa chỉ đầu tiên của nhãn
