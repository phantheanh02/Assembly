# Ví dụ 3.2 tuần 3
#Toán tử chia lấy phần dư, kiểm tra số chẵn lẻ
 .data 
 prompt: .asciiz "Nhap so: "
 result: .asciiz "Ket qua (0 la chan, 1 la le): "
 
 .text
 .globl main
 
 main:
 	addi $v0, $zero, 4
 	la $a0,prompt
 	syscall
 	
 	addi $v0,$zero,5
 	syscall
 	move $s0,$v0
 	
 	addi $t0,$zero,2
 	div $t0,$s0,$t0
 	mfhi $s1
 	
 	addi $v0,$zero,4
 	la $a0,result
 	syscall
 	
 	addi $v0,$zero,1
 	move $a0,$s1
 	syscall
 	
 # Kết thúc chương trình
 	addi $v0,$zero,10
 	syscall