# Phan Thế Anh - 20204941
# 16/5/2022
# Assigment 6.7
# Chương trình kiểm tra một số có là SNT hay không?

.data
Input: .asciiz "Nhap so: "
Output1: .asciiz " la SNT"
Output2: .asciiz " khong la SNT"

.text
# Lấy giá trị từ người dùng
	ori $v0, $zero, 4
	la $a0, Input
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
# Kiểm tra SNT
	# Kiểm tra n < 2 
	slti $t0, $s0 , 2
	bnez $t0, no
	
	div $s1, $s0, 2	# max = n/2
	li $s2, 2	# i = 2
loop:
	rem $t0, $s0, $s2 # $t0 = $s0 % $s2
	beqz $t0, no 	# Exit nếu $t0 = 0
	addi $s2, $s2,1	# i = i + 1
	sgt $t1, $s2, $s1	# if (i > max) then $t1=1 else $t1=0
	beqz $t1, loop 		
	j yes
no:
	# In số
	move $a0, $s0
	ori $v0, $zero, 1
	syscall
	# In kết quả
	la $a0, Output2
	ori $v0,$zero, 4
	syscall
	# Exit
	j exit
yes: 
	# In số
	move $a0, $s0
	ori $v0,$zero, 1
	syscall
	# In kết quả 
	la $a0, Output1
	ori $v0,$zero 4
	syscall
exit: 
	ori $v0,$zero, 10
	syscall

	
	