# Bai 2.4
# In ra mot so ngau nhien tu 1-100

.text
# Tạo max 100
    li $a1, 100 
    li $v0, 42
    syscall
# In so ngau nhien   
    li $v0, 1   
    syscall
#exit
	li $v0,10
	syscall