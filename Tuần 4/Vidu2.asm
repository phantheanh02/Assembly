# Bài 4.2 Tuần 4
# Toán tử đảo với XOR

.data
output1: .asciiz "\nNhap 1 gia tri: "
output2: .asciiz "\nGia tri vào: "
output3: .asciiz "\nKet qua sau phep XOR dau tien: "
output4: .asciiz "\nKet qua sau phep XOR thu hai: "

.text
.globl main
main:
	ori $v0,$zero,4
	la $a0,output1
	syscall
	
	ori $v0,$zero,5
	syscall
	move $s0,$v0
	
	ori $v0,$zero,4
	la $a0,output2
	syscall
	
	ori $v0,$zero,34
	move $a0,$s0
	syscall
	
	ori $v0,$zero,4
	la $a0, output3
	syscall
	
	xori $s0,$s0,0xffffffff
	move $a0,$s0
	
	ori $v0,$zero,34
	syscall
	
	ori $v0,$zero,4
	la $a0,output4
	syscall
	
	xori $s0,$s0,0xffffffff
	move $a0,$s0
	ori $v0,$zero,34
	syscall
	
	ori $v0,$zero,10
	syscall