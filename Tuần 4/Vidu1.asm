# Bài 4.1 Tuần 4
# Chuyển một ký tự tù chữ hoa sang chữ thường

.data
output1: .asciiz "\nNhap mot ky tu hoa: "
output2: .asciiz "\nChu thuong ( su dung and) : "
output3: .asciiz "\nChu thuong ( su dung or) : "

.text
.globl main
main:
# in ra output1
	ori $v0,$zero,4
	la $a0,output1
	syscall
# Lấy kí tự vào từ bàn phím	
	ori $v0,$zero,12
	syscall
	move $s0,$v0
# In ra output2	
	ori $v0, $zero,4
	la $a0,output2
	syscall
# And với 0x20	
	or $t0,$s0,$zero
	addi $a0,$t0,0x20
	ori $v0,$zero,11
	syscall
# In output3	
	ori $v0, $zero,4
	la $a0,output3
	syscall
# Or với 0x20
	ori $a0,$s0,0x20
	ori $v0,$zero,11
	syscall
# End	
	ori $v0,$zero,10
	syscall