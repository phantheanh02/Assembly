# Phan Thế Anh -- 20204941
# 6/6/2022
# Bài tập 8.4
# Mã giả
#	main() {
#		static volatile int miles = prompt("Enter the number of miles driven: ")
#		static valatile int gallons = prompt("Enter the number of gallons used: "
#		static valatile int mpg = miles/gallons;
#		output("Your mpg = " + mpg);
#	}

.text
	# Enter the number of miles drive
	la $a0, prompt1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	nop
	sw $v0, input # x
	
	#Enter the number of gallons used
	la $a0, prompt2
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	nop
	sw $v0, input + 4 # y
	
	# Calculate mpg
	lui $t0, 0x1001
	lw $t1, 0($t0)
	lw $t2, 4($t0) 
	div $s2, $t1, $t2
	
	# Printf mpg
	la $a0, output
	li $v0,4
	syscall
	
	move $a0, $s2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.data
input: 	.word 
	.space 8
prompt1: .asciiz "Enter the number of miles driven: "
prompt2: .asciiz "Enter the number of gallons used: "
output: "Your mpg = "


	

	