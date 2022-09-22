# Phan Thế Anh - 20204941
# 16/5/2022
# Assigment 6.2
# Thực hiện câu lệnh "if-then-else"
# if i<j then x = x + 1; z =1; 
# else y = y-1; z=2*z;

.text
# $s2 = j ; $s1 = i
# $t1 = x; $t2 = y
# $t3 = z
	li $s2, 1 # j = 1
	li $s1, 2 # i =2
	li $s3, 3 # m = 3
	li $s4, 4 # n = 4
start: 

# So sánh i<j
	# sgt $t0,$s2,$s1		# if j > i then $t0 = 1 else $t0 = 0
	# beq $t0, $zero, else	# branch else if $t0 != $zero
# So sánh i >= j
	# sgt $t0, $s2,$s1
	# bnez $t0, else
# So sánh i + j <= 0
	#add $t0, $s1, $s2
	# slt $t0, $t0, 0
	# bnez $t0, else
# So sánh i + j > m+n
	add $t0, $s1, $s2 	# $t0 = i+j 
	add $t5, $s3, $s4 	# $t5 = m + n
	sgt $t0, $t0, $t5 	# if i+j > m+n then $t0 = 1 else $t0 =0
	beqz $t0, else 
	addi $t1, $t1, 1	# x = x + 1
	addi $t3, $zero, 1	# z = 1
	j endif
else: 
	addi $t2, $t2, -1	# y = y -1
	add $t3, $t3, $t3	# z = z*z
endif: