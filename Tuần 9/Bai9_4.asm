# Phan Thế ANh - 20204941
# 13/6/2022
# Bài tập 9.4
# Tính abs

.text
main:
	li $a0, -45
	jal abs
	nop
	add $s0, $zero, $v0
	jal Exit
endmain:
abs:
	sub $v0, $zero, $a0
	bltz $a0, done
	add $v0, $a0, $zero
done:
	jr $ra
.include "utils.asm"