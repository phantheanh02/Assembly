# Thư viện hàm MIPS
# Auther: Phan Thế Anh

.text 
# Subprogram: PrintString
# Purpost: In chuỗi
# Input: $a0 - chứa địa chỉ chuỗi cần in
# Output: none
# Side effects: In ra chuỗi kí tự
PrintString:
	li $v0,4
	syscall
	jr $ra

.text
# Chương trình con tạo dòng mới
# Input: none
# Output: none
# Side effects: In ra một dòng mới
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"
	
.text
# Subprogeam: PrintInt
# Author: 
# Purpose: In 1 chuỗi từ input
# Input: $a0 - địa chỉ chuỗi cần in
#	 $a1 - giá trị cần in
# Return: none
# Side effects: chuỗi + số được in ra màn hình
PrintInt:
	
	# In chuỗi
	li $v0, 4
	syscall
	# In số
	move $a0,$a1
	li $v0, 1
	syscall
	
	#return
	jr $ra

.text
# Subprogeam: PromptInt
# Author: 
# Purpose: In cho người dùng nhập 1 số nguyên và trả lại giá trị đó
# Input: $a0 - địa chỉ chuỗi cần in
# Return: $v0 - giá trị người dùng nhập vào
# Side effects: chuỗi + số được in ra màn hình
PromptInt:
	# In chuỗi
	li $v0,4
	syscall
	# Đọc số nguyên từ người dùng
	
	li $v0,5
	syscall
	#return
	jr $ra

	
.text
# Subprogram: Exit
# Purpose: thoát chương trình
# Input: none
# Output: none
Exit:
	li $v0,10
	syscall

.text
# Subprogram: PromptString
# Purpose: to prompt for a string, allocate the string
#	and return the string to the calling subprogram
# Input:	$a0 - the prompt
#		$a1 - the max size of the string
# Output:	$v0 - The address of the user enterd string
PromptString:
	addi $sp, $sp, -12	
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $s0, 8($sp)
	
	li $v0, 4	# Print the prompt in the function
	syscall
	
	li $v0, 9	# Allocate memory
	lw $a0, 4($sp)
	syscall
	move $s0, $v0
	
	move $a0, $v0	# read the string
	li $v0, 8
	lw $a1, 4($sp)
	syscall
	
	move $v0, $a0	# save string address to return
	
	lw $ra, 0($sp)
	lw $s0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

.text
#Subprogram: AllocateArray
# Purpose: To allocate an array of $a0, each of size $a1
# Input: $a0 - The number of items in the array
#	 $a1 - The size of each item
# Output: $v0 - Address of the array allocated
AllocateArray:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	mul $a0, $a0, $a1
	li $v0, 9
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

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

.text
# Subprogram: BubbleSort
# Purpose: Sort data using a Bubble Sort algorithm
# Input Params: $a0 - base address of array
#		$a1 - array size
# Register conventions:
#	$s0 - array base
#	$s1 - array size
#	$s2 - outer loop counter
# 	$s3 - inner loop counter
BubbleSort:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	
	move $s0, $a0
	move $s1, $a1
	
	addi $s2, $zero, 0	# outer loop counter
OuterLoop:
	addi $t1, $s1, -1
	slt $t0, $s2, $t1 
	beqz $t0, EndOuterLoop
	
	addi $s3, $zero, 0	# inner loop counter
	InnerLoop:
		addi $t1, $s1, -1
		sub $t1, $t1, $s2
		slt $t0, $s3, $t1
		beqz $t0, EndInnerLoop
		
		sll $t4, $s3, 2	# Load data[j], Note offset is 4 bytes
		add $t5, $s0, $t4
		lw $t2, 0($t5)
		
		addi $t6, $t5, 4 # Load data[j+1]
		lw $t3, 0($t6)
		
		sgt $t0, $t2, $t3
		beqz $t0, NotGreater
			move $a0, $s0
			move $a1, $s3
			addi $t0, $s3, 1
			move $a2, $t0
			jal Swap
		NotGreater:
		addi $s3, $s3, 1
		b InnerLoop
	EndInnerLoop:
		addi $s2, $s2, 1
		b OuterLoop
EndOuterLoop:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
.text
# Subprogram: Swap
# Purpose: to swap values in an array of integers
# Input parameters:	$a0 - the array containing elements to swap
#			$a1 - index of element 1
#			$a2 - index of element 22
# Side Effects: Array is changed to swap element 1 and 2
Swap:
	sll $t0, $a1, 2	# calculate address of element 1
	add $t0, $a0, $t0
	sll $t1, $a2, 2	# calculate address of element 2
	add $t1, $a0, $t1
	
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	sw $t2, 0($t1)
	sw $t3, 0($t0)
	
	jr $ra
	
.text
# Subprogram: PrintIntArray
# Purpose: print an array of ints
# Input: $a0 - the base address of the array
#	 $a1 - the size of the array
PrintIntArray:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0	# save the base of the array to $s0
	
	# initialization for counter loop
	# $s1 is the ending index of the loop
	# $s2 is the loop counter
	move $s1, $a1
	move $s2, $zero
	
	la $a0, open_bracket
	jal PrintString	
loop:
	# check ending condition
	sge $t0, $s2, $s1
	bnez $t0, end_loop
	
	sll $t0, $s2, 2		# Multiply the loop counter by 4 to get offset
	add $t0, $t0, $s0	# address of next array element
	lw $a1, 0($t0)		# Next array element
	la $a0, comma
	jal PrintInt
	
	addi $s2, $s2, 1
	b loop
end_loop:
	li $v0, 4
	la $a0, close_bracket
	syscall
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra
.data
	open_bracket: .asciiz "[ "
	close_bracket: .asciiz " ]"
	comma: .asciiz ", "

.text
# Subprogram: PrintIntArray
# Purpose: print an array of ints from the ending index
# Input: $a0 - the base address of the array
#	 $a1 - the size of the array
PrintIntArrayEnd:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	addi $s2, $a1, -1		# $s2 is the loop counter
	move $s0, $a0	# save the base of the array to $s0
	
	la $a0, open_bracket
	jal PrintString	
LoopEnd:
	# check ending condition
	sge $t0, $s2, $zero  
	beqz $t0, end_loop_End   
	
	sll $t0, $s2, 2		# Multiply the loop counter by 4 to get offset
	add $t0, $s0, $t0	# address of next array element
	lw $a1, 0($t0)		# Next array element
	la $a0, comma
	jal PrintInt
	
	addi $s2, $s2, -1
	b LoopEnd
end_loop_End:
	li $v0, 4
	la $a0, close_bracket
	syscall
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra


