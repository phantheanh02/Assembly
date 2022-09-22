.data
Input : .word 0:100
no: .asciiz "Error"
.text
	la $a0, Input		#nhap chuoi so theo dang string
	li $a1,100 		#toi da 100 ky tu
	li $v0,8 		# syscall voi v0=8 ~> nhap string
	syscall
	la $s0, Input		#luu vi tri string vao s0 ~ vi tri ky tu dau tien cua string
	addi $s1,$zero,0 	#i=0
	addi $s2,$zero,0 	#so can in ra (X)
	
chuyenso:
	add $t0,$s1,$s0 	#t1 = i + vi tri string ~> vi tri cua ky tu i dang tro den
	lb $t1,0($t0) 		#load 1 byte tu vi tri t0 vao t1 (t1 dang tro toi A[i], la 1 chuoi cac ky tu bat dau tu A[i], 
				# muon chi lay ra A[i] thi minh chi load 1 byte
	beq $t1, '\n' ,end 		#neu t1 = null thi ket thuc
#so sanh neu ky tu ngoai khoang '0' den '9' thi next
	sle $t3, $t1, '9' 	#neu t1<'0' thi t3=1
	sge $t2, $t1, '0' 	#neu '9'< t1 thi t2=1
	and $t3, $t3, $t2
	bne $t3, 1, false 	#a0<'0' thi bo qua ky tu nay (de xet ky tu tiep)
	#beq $t2, 1, false 	#a0>'9' thi bo qua ky tu nay (de xet ky tu tiep)

	addi $t1,$t1,-48 	#chuyen tu ascii (48~57) ve gia tri so
	sll $t3, $s2, 1 	#t3=2x
	sll $t2, $s2, 3 	#t2=8x
	add $t2, $t3, $t2	#t2 = 2x + 8x = 10x
	add $s2,$t2,$t1		#x=10x+a0
	
next:
	addi $s1,$s1,1 		#++i
	j chuyenso 

end:
	li $v0,1 #in dang so nguyen thap phan
	addi $a0,$s2,0 #in X
	syscall
	j Exit
false:
	la $a0, no
	li $v0, 4
	syscall
Exit:
	li $v0, 10
	syscall
