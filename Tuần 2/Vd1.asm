# pprogram 2.1
# Program hello world
.data					# Chi thi hop ngu
greeting: .asciiz "Hello world" 	# gan xau de in ra man hinh

.text
main:
	li $v0,4			
	la $a0,greeting
	syscall 
	
	li $v0, 10
	syscall  