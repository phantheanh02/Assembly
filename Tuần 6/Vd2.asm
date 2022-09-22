# Ví dụ 2
# Các điều kiện logic phức tạp
# if x>0 && x%2 == 0

lw $t0,x 	# Nạp giá trị x vào $t0
sgt $t1,$t0,$zero	# if $t0 > 0 then $t1 = 1 else $t1 = 0
rem $t2, $t0,2 	# if $t0 % 2 == 0 then $t2 =1 else $t2 = 0
not $t2, $t2	# $t2 = not $t2
and $t1, $t1, $t2	# $t1 = $t1 AND $t2
beqz $t1, end_if # Nhảy đến end_if nếu $t1 = 0