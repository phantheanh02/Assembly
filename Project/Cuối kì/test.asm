.text
	la $a0, ThongTinDisk1
	la $a1, Disk1
	li $a2, 5
	li $v0, 54
	syscall
	
	la $a0, ThongTinParity
	la $a1, Disk3
	li $a2, 9
	li $v0, 54
	syscall
	
	li $t0, 0	# i
	li $t1, 2	# Để kiểm tra tính chẵn lẻ của i
	la $s0, Disk1	# $s0 chứa địa chỉ của ổ đĩa vẫn còn dữ liệu
	la $s1, Disk3	# $s1 chứa dữ liệu parity

	lb $t5, 0($s0)
Loop_LayDuLieu:
	beq $t0, 8, End_Loop_LayDuLieu
	add $t3, $s1,$t0	# Chứa địa chỉ của kí tự đang xét
	lb $t4, 0($t3)		# $t4 = parity[i]
	addi $t4,$t4,-48	# Chuyển kí tự về số
	sll $t4, $t4, 4		# $t4 chuyển về số nhị phân
	div $t0, $t1
	mfhi $t2

	
End_Loop_LayDuLieu:
.data	
ThongTinDisk1: .asciiz "Thong tin disk 1"
ThongTinParity: .asciiz "Thong tin parity"
KhoiPhuc: .asciiz "Ban bi mat du lieu? Co muon khoi phục khong?"
Disk1: .space 4
Disk2: .space 4
Disk3: .space 8
.include "utils.asm"