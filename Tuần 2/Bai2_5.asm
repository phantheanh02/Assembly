# Bài 2,5
# Chương trình nghỉ 4s trước khi thoát
.data
output: .asciiz "End program 2"
.text

# sleep 4s	
	li $a0,4000
	li $v0,32
	syscall
# In ra chuoi
	li $v0,4
	la $a0, output
	syscall
# end	
	li $v0,10
	syscall