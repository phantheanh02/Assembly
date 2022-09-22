# Ví dụ 3
# if  0<x<10 and x % 2 == 0

lw $t0,x 	# Nạp giá trị x vào $t0
sgt $t1,$t0,$zero	# if $t0 > 0 then $t1 = 1 else $t1 = 0
li $t5, 10 	# Gán $t5 = 10
slt $t2,$t0,$t5	# if $t0 < $t5 then $t2 = 1 else $t2 = 0
rem $t3, $t0,2 	# if $t0 % 2 == 0 then $t3 =1 else $t3 = 0
not $t3, $t3	# $t2 = not $t2
and $t1, $t1, $t2	# $t1 = $t1 AND $t2
and $t1, $t1, $t3	# $t1 = $t1 AND $t3
beqz $t1, end_if # Nhảy đến end_if nếu $t1 = 0