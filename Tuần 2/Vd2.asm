# Program 2.2
# Nhap vao 1 so nguyen va in ra man hinh

.data
prompt: .asciiz "Hay nhap vao 1 so nguyen: "
output: .asciiz "\nBan da nhap vao so: "

.text
main:
# In ra xau prompt
	li $v0,4
	la $a0,prompt
	syscall

# Doc so nguyen nhap vao va ghi vao $s0	
	li $v0,5
	syscall
	move $s0,$v0

# In ra xau output	
	li $v0,4
	la $a0,output
	syscall

# in ra so nguyen da nhap	
	li $v0,1
	move $a0, $s0
	syscall

# Exit
	li $v0,10
	syscall