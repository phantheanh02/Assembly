# Phan Thế Anh - 20204941
# 16/5/2022
# Assigment 6.1
# Thực hiện câu lệnh "if-then-else"
# if i<=j then x = x + 1; z =1; 
# else y = y-1; z=2*z;

.text
# $s2 = j ; $s1 = i
# $t1 = x; $t2 = y
# $t3 = z
	li $s2, 1
	li $s1, 2
start: 
	slt $t0,$t2,$s1		# if j > i then $t0 = 1 else $t0 = 0
	bne $t0, $zero, else	# branch else if $t0 != $zero
	addi $t1, $t1, 1	# x = x + 1
	addi $t3, $zero, 1	# z = 1
	j endif
else: 
	addi $t2, $t2, -1	# y = y -1
	add $t3, $t3, $t3	# z = z*z
endif: