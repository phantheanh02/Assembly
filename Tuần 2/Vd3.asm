# program 2.3
#Chương trình nhắc và đọc vào một chuỗi từ người dùng

.data
input: .space 81
inputSize: .word 80
prompt: .asciiz "Hay nhap vao mot chuoi: "
output: .asciiz "\nBan da nhap vao chuoi: "

.text
main:
# In ra chuoi Prompt
	li $v0,4
	la $a0,prompt
	syscall
#  Doc chuoi	
	li $v0,8
	la $a0,input
	lw $a1,inputSize
	syscall
# In ra output	
	li $v0,4
	la $a0,output
	syscall
# In ra chuoi input	
	la $v0,4
	la $a0,input
	syscall
# Exit
	li $v0,10
	syscall