# Ví dụ 3.3 Tuần 3
# Tính biểu thức : 5x^2 + 2x + 3 

.data
prompt: .asciiz "Hay nhap vao gia tri x: "
result: .asciiz "Ket qua: "

.text
.globl main
main: 
	addi $v0,$zero,4
	la $a0,prompt
	syscall
	
	addi $v0,$zero,5
	syscall
	move $s0,$v0
	
	mul $t0,$s0,$s0
	mul $t0,$t0,5
	mul $t1,$s0,2
	add $t0,$t0,$t1
	addi $s1,$t0,3
	
	addi $v0,$zero,4
	la $a0,result
	syscall
	
	addi $v0,$zero,1
	move $a0,$s1
	syscall
	
# exit
	addi $v0,$zero,10
	syscall