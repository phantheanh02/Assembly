.text 
PrintString:
	li $v0,4
	syscall
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
	
# Subprogeam: PrintInt
# Author: 
# Purpose: In 1 chuỗi từ input
# Input: $a0 - địa chỉ chuỗi cần in
#	 $a1 - giá trị cần in
# Return: none
# Side effects: chuỗi + số được in ra màn hình
.text
PrintInt:
	# In chuỗi
	li $v0,4
	syscall
	# In số
	move $a0,$a1
	li $v0,1
	syscall
	#return
	jr $ra

# Subprogeam: PromptInt
# Author: 
# Purpose: In cho người dùng nhập 1 số nguyên và trả lại giá trị đó
# Input: $a0 - địa chỉ chuỗi cần in
# Return: $v0 - giá trị người dùng nhập vào
# Side effects: chuỗi + số được in ra màn hình
.text
PromptInt:
	# In chuỗi
	li $v0,4
	syscall
	# Đọc số nguyên từ người dùng
	
	li $v0,5
	syscall
	#return
	jr $ra

# Hàm Exit
.text
Exit:
	li $v0,10
	syscall	
	
# Subprogeam: 	NOR2
# Author: 	Phan Thế Anh
# Purpost: 	lấy hai tham số đầu vào và trả về kết quả NOR trên hai tham số đó
# Input:	$a0 - tham số thứ nhất
#		$a1 - tham số thứ hai
# Return:	$a0 NOR $a1
# side effects:	 In ra  kq			
.text
NOR2:
	# In chuỗi
	move $t0,$a0
	la $a0, outputNOR
	ori $v0, $zero, 4
	syscall
	# In kq
	nor $a0, $t0, $a1
	ori $v0, $zero,35
	syscall
	jr $ra
.data
	outputNOR: .asciiz "\nKQ NOR = "
	
# Subprogeam: 	NAND2
# Author: 	Phan Thế Anh
# Purpost: 	lấy hai tham số đầu vào và trả về kết quả NAND trên hai tham số đó
# Input:	$a0 - tham số thứ nhất
#		$a1 - tham số thứ hai
# Return:	$a0 NAND $a1
# side effects:	 In ra  kq
.text
NAND2:
	# In chuỗi
	move $t0,$a0
	la $a0, outputNAND
	ori $v0, $zero, 4
	syscall
	# In kq
	and $a0, $t0, $a1
	not $a0,$a0
	ori $v0, $zero,35
	syscall
	jr $ra
.data
	outputNAND: .asciiz "\nKQ NAND = "

# Subprogeam: 	NOT2
# Author: 	Phan Thế Anh
# Purpost: 	lấy một tham số đầu vào và trả về kết quả NOT trên tham số đó
# Input:	$a0 - tham số 
# Return:	NOT $a0
# side effects:	 In ra  kq
.text
NOT2:
	# In chuỗi
	move $t0,$a0
	la $a0, outputNOT
	ori $v0, $zero, 4
	syscall
	# In kq
	not $a0,$t0
	ori $v0, $zero,35
	syscall
	jr $ra
.data
	outputNOT: .asciiz "\nKQ NOT = "

# Subprogeam: 	Mult4
# Author: 	Phan Thế Anh
# Purpost: 	lấy một tham số đầu vào và trả về kết quả tham số đó nhân với 4
# Input:	$a0 - tham số 
# Return:	$a0 * 4
# side effects:	 In ra  kq
.text
Mult4:
	# In chuỗi
	move $t0,$a0
	la $a0, outputMult4
	ori $v0, $zero, 4
	syscall
	# In kq
	srl $a0, $t0 , 2
	ori $v0, $zero,35
	syscall
	jr $ra
.data
	outputMult4: .asciiz "\nKQ * 4 = "

# Subprogeam: 	Mult10
# Author: 	Phan Thế Anh
# Purpost: 	lấy một tham số đầu vào và trả về kết quả tham số đó nhân với 10
# Input:	$a0 - tham số 
# Return:	$a0 * 10
# side effects:	 In ra  kq
.text
Mult10:
	# In chuỗi
	move $t0,$a0
	la $a0, outputMult10
	ori $v0, $zero, 4
	syscall
	# In kq
	srl $a0, $t0 , 1
	srl $t0, $t0, 3
	add $a0, $t0, $a0
	ori $v0, $zero,35
	syscall
	jr $ra
.data
	outputMult10: .asciiz "\nKQ * 10 = "

# Subprogeam: 	HoanDoi
# Author: 	Phan Thế Anh
# Purpost: 	lấy hai tham số đầu vào, hoán đổi chúng với 4
# Input:	$a0 - tham số thứ nhát
#		$a1 - tham số thứ hai
# Return:	 $a1 = $a0, $a0 = $a1
# side effects:	 In ra  kq
.text
HoanDoi:
	# In chuỗi
	move $t0,$a0
	la $a0, outputHoanDoi
	ori $v0, $zero, 4
	syscall
	# Thực hiện hoán đổi
	xor $a0, $t0, $a1
	xor $a1, $a1, $a0
	xor $a0, $a0, $a1
	# In kq
	ori $v0, $zero, 1
	syscall
	move $a0, $a1
	ori $v0, $zero, 1
	syscall
	jr $ra
.data
	outputHoanDoi: .asciiz "\nHoan doi:  "

# Subprogeam: 	RightCircularShift
# Author: 	Phan Thế Anh
# Purpost: 	Nhận một tham số đầu vào và trả về hai giá trị
# Input:	$a0 - tham số
# Return:	Giá trị dịch chuyển 1 bit bằng phép dịch vòng phải
#		Giá trị của bit đã được dịch chuyển
# side effects:	 In ra  kq
.text
RightCircularShift: 
	# In chuỗi Giá trị 1
	move $t0,$a0
	la $a0, giatri1
	ori $v0, $zero, 4
	syscall
	# Thực hiện dịch vòng phải 1 bit
	ror $a0, $t0, 1
	ori $v0, $zero, 35
	syscall
	# In chuỗi Giá trị 2
	move $t0,$a0
	la $a0, giatri2
	ori $v0, $zero, 4
	syscall
	# Lấy giá trị bit chuyển
	srl $a0, $a0,31
	ori $v0, $zero, 1
	syscall
.data
	giatri1: .asciiz "\nDich vong phai 1 bit: "
	giatri2: .asciiz "\nBit duoc dich chuyen: "

# Subprogeam: 	LeftCircularShift
# Author: 	Phan Thế Anh
# Purpost: 	Nhận một tham số đầu vào và trả về hai giá trị
# Input:	$a0 - tham số
# Return:	Giá trị dịch chuyển 1 bit bằng phép dịch vòng trai
#		Giá trị của bit đã được dịch chuyển
# side effects:	 In ra  kq
.text
LeftCircularShift: 
	# In chuỗi Giá trị 1
	move $t0,$a0
	la $a0, giatri11
	ori $v0, $zero, 4
	syscall
	# Thực hiện dịch vòng trai 1 bit
	rol $a0, $t0, 1
	ori $v0, $zero, 35
	syscall
	# In chuỗi Giá trị 2
	move $t0,$a0
	la $a0, giatri22
	ori $v0, $zero, 4
	syscall
	# Lấy giá trị bit chuyển
	sll $a0, $a0,31
	srl $a0, $a0, 31
	ori $v0, $zero, 1
	syscall
.data
	giatri11: .asciiz "\nDich vong trai 1 bit: "
	giatri22: .asciiz "\nBit duoc dich chuyen: "

# Subprogeam: 	ToUpper
# Author: 	Phan Thế Anh
# Purpost: 	Nhận một đầu vào 32 bit bao gồm 3 ký tự và một ký tự rỗng, hoặc 3 ký tự chuỗi.
# 		Chuyển 3 ký tự thành chữ hoa nếu chúng là chữ thường hoặc 
# 		không làm gì cả nếu chúng đã là chữ hoa
# Input:	$a0 - một đầu vào 32 bit
#		$a1 - độ dài chuỗi
# Return:	Chuyển 3 ký tự thành chữ hoa nếu chúng là chữ thường hoặc 
#		không làm gì cả nếu chúng đã là chữ hoa
# side effects:	 In ra  kq
.text
ToUpper:
	move $t1,$a0
	# In chuỗi
	li $v0, 4
	la $a0, upper
	syscall
	# Chuyển kí tự 
	srl $t0,$a0,16
	xor $t0,$t0,0x20
	move $a0,$t0
	li $v0,11
	syscall
	
	srl $t0,$t1,8
	xor $t0,$t0,0x20
	move $a0,$t0
	li $v0,11
	syscall
	
	xor $a0,$t1,0x20
	li $v0,11
	syscall
.data
	upper: .asciiz "\nUpper: "
# Subprogeam: 	ToLower
# Author: 	Phan Thế Anh
# Purpost: 	Nhận một đầu vào 32 bit bao gồm 3 ký tự và một ký tự rỗng, hoặc 3 ký tự chuỗi.
# 		Chuyển 3 ký tự thành chữ hoa nếu chúng là chữ thường hoặc 
# 		không làm gì cả nếu chúng đã là chữ hoa
# Input:	$a0 - một đầu vào 32 bit
#		$a1 - độ dài chuỗi
# Return:	Chuyển 3 ký tự thành chữ thường nếu chúng là chữ hoa hoặc 
#		không làm gì cả nếu chúng đã là chữ thường
# side effects:	 In ra  kq
.text
ToLower:
	move $t1,$a0
	# In chuỗi
	li $v0, 4
	la $a0, lower
	syscall
	# Chuyển kí tự 
	srl $t0,$a0,16
	or $t0,$t0,0x20
	move $a0,$t0
	li $v0,11
	syscall
	
	sll $t1, $t1, 8
	srl $t0,$t1,16
	or $t0,$t0,0x20
	move $a0,$t0
	li $v0,11
	syscall
	
	sll $t1, $t1, 8
	srl $t0,$t1,16
	or $a0,$t1,0x20
	li $v0,11
	syscall
.data
	lower: .asciiz "\nLower: "
