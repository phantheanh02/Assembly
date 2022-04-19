# Bai 2.3
# chương trình nhắc người dùng nhập vào loại bánh mà họ thích

.data
input: .space 31
inputSize: .word 30
prompt: .asciiz "What kind of cake do you like?: "
output1: .asciiz "\nSo you like: "
output2: .asciiz " pie"
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
# In ra output1
	li $v0,4
	la $a0,output1
	syscall
# In ra chuoi input	
	la $v0,4
	la $a0,input
	syscall
# In ra chuoi input2
	li $v0,4
	la $a0,output2
	syscall
# Exit