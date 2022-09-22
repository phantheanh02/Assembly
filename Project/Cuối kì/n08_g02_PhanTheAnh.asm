# Phan Thế Anh - 20204941
# Project cuối kỳ: Bài số 8
# Mô phỏng ổ đĩa RAID5
# Test case : DCE.****ABCD1234HUSTHUST
.text
	addi $s7, $zero, 1
# ----------------------------------- Băt đầu chương trình -----------------------------------
Begin:
	# Lấy chuỗi kí tự từ người dùng
	la $a0, Input		# Thông báo người dùng nhập dữ liệu
	addi $a1, $zero, 1000	# Độ dài tối đa của chuỗi
	jal PromptString	# Lấy chuỗi kí tự
	move $s0, $v0		# Lưu địa chỉ chuỗi kí tự vào $s0
	
# 		--------------- Kiểm tra độ dài của chuỗi ---------------
	addi $t0, $zero, 0	# $t0 = length(string) = 0
  	# Đếm độ dài của chuỗi
  	Count_length:
		add $t2, $t0, $s0	# $t2 = địa chỉ của string[i]
		lb $t3, 0($t2)		# $t3 = string[i]
		beq $t3, '\n', Check_length	# Điều kiện kết thúc vòng lặp	  
		addi $t0, $t0, 1	# length(string)++
		j Count_length
 	# Kiểm tra độ dài có chia hết cho 8 không?
	Check_length:
		addi $t1, $zero, 8	# $t1 = 8
		div $t0, $t1		# length / 8
		mfhi $t2		# $t2 = $t0 mode $t1
		mflo $s4		# $s4 = $t0 div 8 : số hàng
		beqz $t2, Do 		# Nếu $t2 = 0 thì tiếp tục chương trình
		# Nếu sai yêu cầu người dùng nhập lại
		la $a0, Error
		li $v0, 55
		syscall
		# Nếu người dùng không muốn tiêp tục thì kết thúc chương trình
		j End
# 		--------------- Kết thúc kiểm tra ---------------	
# ----------------------------- Sắp xếp dữ liệu vào ổ đĩa -----------------------------------
	Do:
		# Khai báo địa chỉ các mảng
		la $s1, Disk1		# Lưu trữ vị trí của disk 1
		la $s2, Disk2		# Lưu trữ vị trí của disk 2
		la $s3, Disk3		# Lưu trữ vị trí của Parity
		li $s5, 0		# Số phần tử trong Parity
		#la $s6, ViTriParity	# Mảng lưu trữ vị trí của Parity
		# In ổ đĩa
		la $a0, string1
		jal PrintString
		la $a0, string2
		jal PrintString
		# Cài dặt tham sô trước vòng lặp	
		addi $t0, $zero, 0	# Số hàng
		addi $t1, $zero, 0	# Vị trí kí tự đang cần xét: i
# 		--------------- Bắt đầu vòng lặp lưu dữ liệu ---------------	
	Loop_row:
		# if n > số hàng then kết thúc vòng lặp
		beq $t0, $s4, End_loop_row
		addi $t0, $t0, 1	# Hàng thứ n	
		addi $t2, $zero, 8	# Số kí tự mỗi hàng
		addi $t3, $zero, 0	# Vị trí kí tự trong block: j
# 		--------------- Vòng lặp xử lý lần lượt 8 kí tự ---------------
		# Lấy 8 kí tự cần chia vào 2 ổ
		Loop_char:
			# Kiểm tra điều kiện kết thúc
			beqz $t2, End_loop_char # Nếu điền hết kí tự thì kết thúc vòng lặp
			# Ghi ký tự vào block
			add $t4, $s0, $t1	# Địa chỉ kí tự đang xét
			lb $t5, 0($t4)		# $t5 = string[i]
			blt $t2, 5, Write_Disk2 # Từ kí tự thứ 5 sẽ được ghi vào Disk 2  
			# Write Disk 1
			add $t4, $s1, $t3	# Địa chỉ của kí tự trong block
			sb $t5, ($t4)		# Disk1[j] = string[i]
			j Condition
		  Write_Disk2: 
			# Write Disk 2
			add $t4, $s2, $t3	# Địa chỉ của kí tự trong block
			sb $t5, -4($t4)		# Disk2[j] = string[i]
		  Condition: # Thay đổi các giá trị biến đếm
			addi $t3, $t3, 1	# j++
			addi $t1, $t1, 1	# i++
			addi $t2, $t2, -1	# Số kí tự còn lại
			j Loop_char	
		End_loop_char:
# 		--------------- Kết thúc vòng lặp xử lý 8 kí tự ---------------
		# Kiểm tra xem parity ở ổ đĩa nào
		
		addi $t2, $0, 3		# $t2 = 3
		div $t0, $t2		# n / 3
		mfhi $t3		# $t3 = n mode 3
		beq $t3, 1, TH1
		beq $t3, 2, TH2
		beq $t3, 0, TH3
# ----------------------------------------------	
	# Thực hiện điền kí tự có 3 trường hợp
		TH1: # Parity ở ổ đĩa 3
			la $a0, string3
			jal PrintString
			# In ra dữ liệu ở ổ đĩa
			move $a0, $s1
			jal Print_string_array
	
			la $a0, string4
			jal PrintString
			la $a0, string3
			jal PrintString
			# In ra dữ liệu ở ổ đĩa
			move $a0, $s2
			jal Print_string_array
	
			la $a0, string4
			jal PrintString
			la $a0, string5
			jal PrintString
			# Tính toán phần dữ liệu parity  và in ra màn hình
			jal Write_Disk3
	
			la $a0, string6
			jal PrintString
			jal PrintNewLine
			j Loop_row		# Quay lại vòng lặp lưu dữ liệu
		TH2: # Parity ở ổ đĩa 2
			la $a0, string3
			jal PrintString
			move $a0, $s1
			jal Print_string_array
	
			la $a0, string4
			jal PrintString
			la $a0, string5
			jal PrintString
			jal Write_Disk3
	
			la $a0, string6
			jal PrintString
			la $a0, string3
			jal PrintString
			move $a0, $s2
			jal Print_string_array
	
			la $a0, string7
			jal PrintString
			jal PrintNewLine
			j Loop_row		# Quay lại vòng lặp lưu dữ liệu
		TH3: # Parity ở ổ đĩa 1	
			la $a0, string5
			jal PrintString
			jal Write_Disk3
	
			la $a0, string6
			jal PrintString
			la $a0, string3
			jal PrintString
			move $a0, $s1
			jal Print_string_array
	
			la $a0, string4
			jal PrintString
			la $a0, string3
			jal PrintString
			move $a0, $s2
			jal Print_string_array
	
			la $a0, string7
			jal PrintString
			jal PrintNewLine
			j Loop_row		# Quay lại vòng lặp lưu dữ liệu
	End_loop_row:
	la $a0, string2
	jal PrintString
	beq $s7, 0, D		# Nếu muốn sử dụng Chương trình demo khôi phục dữ liệu
# 		--------------- Kết thúc vòng lặp lưu dữ liệu ---------------
# ----------------------------------- Kết thúc -----------------------------------	

# ----------------------------------- Khôi phục dữ liệu -----------------------------------	
	# Hỏi người dùng có muốn bắt đầu chương trình demo khôi phục dữ liệu
	la $a0, KhoiPhuc
	li $v0, 50
	syscall
	
	move $s7, $a0
	bnez $a0, End 
	j Begin
D: 	
	la $a0, DuLieuKhoiPhuc
	li $v0, 4
	syscall
C:	# Ổ đĩa cần khôi phục
	addi $t0, $zero, 0	# disk[i]
	la $a0, InputKP
	li $v0, 51
	syscall
	
	# Khôi phục ổ 1
	bne $a0, 1, A
	la $s0, Disk2
	la $s1, Disk3
	j BeginKhoiPhuc
A:	# Khôi phục ổ 2
	bne $a0, 2, B
	la $s0, Disk1	
	la $s1, Disk3
	j BeginKhoiPhuc
B:	# Nếu không phải ổ 1 or 2 thì return
	la $a0, DiskError
	li $v0, 55
	syscall
	j C

# Bắt đầu vòng lặp khôi phục
BeginKhoiPhuc:
	beq $t0, 4, EndKhoiPhuc
	add $t1, $t0, $s0
	add $t2, $t0, $s1
	lb $t3, 0($t1)
	lb $t4, 0($t2)
	xor $a0, $t3, $t4
	li $v0, 11
	syscall
	addi $t0, $t0, 1
	j BeginKhoiPhuc
EndKhoiPhuc:	
# ------------------------------- Kết thúc khôi phục dữ liệu -----------------------
End:
	# Đưa ra yêu cầu hỏi người dùng có muốn tiếp tục hay không?
	la $a0, Return
	li $v0, 50
	syscall
	beqz $a0, Begin		# Nếu người dùng nhập vào là 0 thì quay lại chương trình
				# nếu là kí tự khác thì kết thúc chương trình
	li $t0, ,0  
	
	# In ra lời cảm ơn và Exit
	la $a0, Finish
	la $a1, Thanks
	li $v0, 59
	syscall
	jal Exit	
.data
#hex: .byte '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' 
Input: .asciiz "\nNhap chuoi ki tu : "
Error: .asciiz "Do dai khong hop le!!\n"
Thanks: .asciiz "Cam on ban da su dung chuong trinh!!!"
Return:.asciiz "\nBan muon su dung tiep? : "
Finish: .asciiz "Ket thuc chuong trinh!!\n"
ThongTinDisk1: .asciiz "Thong tin disk 1"
ThongTinParity: .asciiz "Thong tin parity"
InputKP: .asciiz "O dia bi mat"
KhoiPhuc: .asciiz "Demo chuong trinh khoi phuc du lieu ( max 8 ki tu)"
DiskError: .asciiz "Pleas enter 1 or  2"
DuLieuKhoiPhuc: .asciiz "\nDu lieu sau khi khoi phuc la:\n"
Disk1: .space 4
Disk2: .space 4
Disk3: .space 1000
O1: 	.space 1000
O2:	.space 1000
string1: .asciiz "     Disk 1               Disk 2               Disk 3\n"
string2: .asciiz " --------------       --------------       --------------\n"
string3: .asciiz "|     "        
string4: .asciiz "     |     "
string5: .asciiz "[[ "
string6: .asciiz "]]     "
string7: .asciiz "     |"
commas: .asciiz ","	
.include "utils.asm"
