# Lê Thế Anh - 20200018
# Project cuối kì: bài 2
# Bộ môn : Thực hành kiến trúc máy tính - IT3280
# Mã lớp : 130997
# Giảng viên hướng dẫn : Nguyễn Thị Thanh Nga
# Ngày hoàn thành: 22/7/2022

#Yêu cầu đề bài

#Viết một chương trình sử dụng MIPS để vẽ một quả bóng di chuyển trên màn hình mô phỏng Bitmap của Mars). 
#Nếu đối tượng đập vào cạnh của màn hình thì sẽ di chuyển theo chiều ngược lại.
#Yêu cầu:
#- Thiết lập màn hình ở kích thước 512x512. Kích thước pixel 1x1.
#- Quả bóng là một đường tròn.
# Chiều di chuyển phụ thuộc vào phím người dùng bấm, gồm có (di chuyển lên (W), di chuyển xuống (S), Sang trái (A), Sang phải (D) trong bộ giả lập Keyboard and Display MMIO Simulator).
# Tốc độ bóng di chuyển là không đổi. Vị trí bóng ban đầu ở chính giữa màn hình

.data
radius:     .word       15		# bán kính
initial_x:   .word       256		# Tọa độ tâm x ban đầu
initial_y:   .word       256		# Tọa độ tâm y ban đầu
BLACK:  .word       0x00000000
YELLOW: .word	    0x00FFFF00
.eqv KEY_CODE 0xFFFF0004 # 1 byte mã ASCIIZ từ bàn phím
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ?
 			# Auto clear after lw
# midpoint circle algorithm variables (Thuật toán vòng tròn điểm giữa )

# Thiết lập các thông số màn hình
dpy_width:  .word       512
dpy_height: .word       512
dpy_base:   .word       0x10010000

#--------------------------------------------------------------------------
.text
main:
	li 	$k0, KEY_CODE	# chua ký tu nhap vao
	li 	$k1, KEY_READY	# kiem tra da nhap phim nao chua
   	lw	$a0, initial_x	#tọa độ x ban đầu
   	lw	$a1, initial_y	# Tọa độ y ban đầu
   	lw	$a2, YELLOW	# màu
   	jal	draw_circle
loop:

WaitForKey: 
	lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
	nop
	beq $t1, 1, ReadKey # if $t1 == 0 then Polling
	nop
erase_old:  
	addi	$s3, $0, 0
	j	moves
ReadKey:
	lw $s3, 0($k0) # $t0 = [$k0] = KEY_CODE
	j	moves
moves:
	add	$t9, $a0, $0		# set $t9 = $a0 để tránh bị mất khi gọi syscall
	### sleep trong 1 ms để đảm bảo tốc độ khung hình khoảng 1000
	addi	$v0, $zero, 32	# syscall sleep
	addi	$a0, $zero, 10	# 1ms
	syscall
	add	$a0, $t9, $0		#set $a0 back
	j 	check_bonuce

no_check_bonuce: #không bật cạnh		# thanh ghi $s3 lưu hướng di chuyển mới
	beq	$s3, 0, no_new_dir	# if key press = 'd' branch to moveright	
	beq	$s3, 100, moveRight	# if key press = 'd' branch to moveright
	beq	$s3, 97, moveLeft	# else if key press = 'a' branch to moveLeft
	beq	$s3, 119, moveUp		# if key press = 'w' branch to moveUp
	beq	$s3, 115, moveDown	# else if key press = 's' branch to moveDown
no_new_dir:		# Thanh ghi $ s5 lưu hướng di chuyển cũ 
	beq	$s5, 100, moveRight	# if key press = 'd' branch to moveright
	beq	$s5, 97, moveLeft	# else if key press = 'a' branch to moveLeft
	beq	$s5, 119, moveUp		# if key press = 'w' branch to moveUp
	beq	$s5, 115, moveDown	# else if key press = 's' branch to moveDown
set_old_direction: # set old direction ( thiết lập hướng đi cũ ) 
end_move: 	
	j 	loop 

check_bonuce: #Kiểm tra nảy 
# để xác định vị trí nảy thì ta cần dùng tọa độ của tâm
# tọa độ x, y sẽ trong khoảng tờ 0 đến 512 -> vị trí trái nhất là 0 và phải nhất là 512
# Khi quả bóng chạm rìa thì có quả bóng và rìa có ít nhất một điểm chung => khoảng cách từ tâm đến rìa <= bán kính
# ở vị trí trái nhất phải là 13 ( vì bước nhảy là 2 pixels), phải nhất là 512 - 13 = 499

check_bonuce_Left:	# bật cạnh trái ( khi mép bên trái quả bóng màu vàng chạm vào rìa bên trái màn hình thì sẽ bật ngược trở lại)
	addi	$t8, $0, 13	
	slt	$t8, $t8, $a0 	 
	beq	$t8, 1, check_bonuce_Right	# Nếu tọa độ tâm x ($a0) > 13 thì vẫn chưa chạm rìa trái -> check tiếp bật cạnh phải 
	# NẾU KHÔNG ( nghĩa là chạm rìa trái )
	# Trong trường hợp ( không có hướng mới ($s3 = 0) và hưỡng cũ là hướng trái ($s5 = 97 'a') ) hoặc hướng mới là bên trái ($s3 = 97) thì bật sang phải ( j moveRight)  
	seq	$t3, $s3, 97
	seq	$t4, $s5, 97
	seq	$t5, $s3, 0
	and	$t4, $t4, $t5
	or	$t3, $t3, $t4
	beq	$t3, 1, moveRight

# Mấy cái check đằng dưới này tương tự ( tại e lười cmt :)) )
check_bonuce_Right:	# bật cạnh phải
	addi	$t8, $0, 499
	slt	$t8, $a0, $t8 
	beq	$t8, 1, check_bonuce_Up
	seq	$t3, $s3, 100
	seq	$t4, $s5, 100
	seq	$t5, $s3, 0
	and	$t4, $t4, $t5
	or	$t3, $t3, $t4
	beq	$t3, 1, moveLeft
check_bonuce_Up:
	addi	$t8, $0, 13
	slt	$t8, $t8, $a1 
	beq	$t8, 1, check_bonuce_Down
	seq	$t3, $s3, 119
	seq	$t4, $s5, 119
	seq	$t5, $s3, 0
	and	$t4, $t4, $t5
	or	$t3, $t3, $t4
	beq	$t3, 1, moveDown
check_bonuce_Down:
	addi	$t8, $0, 499
	slt	$t8, $a1, $t8
	beq	$t8, 1, no_check_bonuce
	seq	$t3, $s3, 115
	seq	$t4, $s5, 115
	seq	$t5, $s3, 0
	and	$t4, $t4, $t5
	or	$t3, $t3, $t4
	beq	$t3, 1, moveUp
no_bonuce:	# không nảy
	j	no_check_bonuce
								
main_done:
   	li      $v0,10
   	syscall

moveRight:
	lw	$a2, BLACK
	jal	draw_circle
	addi	$s5, $0, 100
	addi	$a0, $a0, 2 
	lw	$a2, YELLOW
	jal	draw_circle
	j	set_old_direction
	
moveLeft:
	lw	$a2, BLACK
	jal	draw_circle
	addi	$s5, $0, 97
	addi	$a0, $a0, -2
	lw	$a2, YELLOW
	jal	draw_circle
	j	set_old_direction

moveUp:
	lw	$a2, BLACK
	jal	draw_circle
	addi	$s5, $0, 119
	addi	$a1, $a1, -2
	lw	$a2, YELLOW
	jal	draw_circle
	j	set_old_direction

moveDown:
	lw	$a2, BLACK
	jal	draw_circle
	addi	$s5, $0, 115
	addi	$a1, $a1, 2
	lw	$a2, YELLOW
	jal	draw_circle
	j	set_old_direction

draw_circle:	
	subi    $sp,$sp,12	# cấp phát bộ nhớ stack cho thanh ghi $ra, $a0, $a1
	sw      $ra,0($sp)
	sw      $a0,4($sp)	# lưu trá trị của thanh ghi $a0, $a1 vào ngăn xếp xíu nữa trả về
	sw      $a1,8($sp)	# vì dùng rất nhiều ở hàm draw8
    

	lw      $s0,radius              # x = radius ( lưu giá trị của bán kính )
	li      $s1,0                   # y = 0	

    # Khởi tạo: xchg = 1 - (2*r)
	li      $s3,1                   # xchg = 1
 	sll     $t0,$s0,1               # get 2 * r
	sub     $s3,$s3,$s0             # xchg -= (2 * r)
	li      $s4,1                   # ychg = 1
	li      $s2,0                   # raderr = 0

draw_circle_loop:
    	blt     $s0,$s1,draw_circle_done      # x >= y? if no, fly (we're done)

    # draw pixels in all 8 octants
    	jal     draw8
	
    	addi    $s1,$s1,1               # y += 1
    	add     $s2,$s2,$s4             # raderr += ychg
    	addi    $s4,$s4,2               # ychg += 2

    	sll     $t0,$s2,1               # get 2 * raderr
    	add     $t0,$t0,$s3             # get (2 * raderr) + xchg
    	blez    $s2,draw_circle_loop          # >0? if no, loop

    	subi    $s0,$s0,1               # x -= 1
    	add     $s2,$s2,$s3             # raderr += xchg
    	addi    $s3,$s3,2               # xchg += 2
    	j       draw_circle_loop

draw_circle_done:
    	lw	$a1,8($sp)	# Trả về giá trị tọa độ tâm x, y
    	lw	$a0,4($sp)
    	lw      $ra,0($sp)
    	addi    $sp,$sp,12
    	jr      $ra

# draw8 -- draw single point in all 8 octants
#
# arguments:
#   s0 -- ( tọa độ x)
#   s1 -- ( tọa dộ y)
#
# registers:
#   t8 -- ( tâm x )
#   t9 -- ( tâm y )
draw8:
    	subi    $sp,$sp,4
    	sw      $ra,0($sp)

    #+drawctr $t8,$t9
    	lw      $t8,8($sp)         # load giá trị của tâm x ( lw 8 vì thêm cái sw $ra của hàm draw8 nên giá trị tâm x bị đẩy xuống byte thứ 8)
    	lw      $t9,12($sp)        # load giá trị của tâm y 

    # draw [+x,+y]
    	add     $a0,$t8,$s0			 
    	add     $a1,$t9,$s1
    	jal     set_pixel

    # draw [+y,+x]
   	add     $a0,$t8,$s1
    	add     $a1,$t9,$s0
    	jal     set_pixel

    # draw [-x,+y]
    	sub     $a0,$t8,$s0
    	add     $a1,$t9,$s1
    	jal     set_pixel

    # draw [-y,+x]
    	add     $a0,$t8,$s1
    	sub     $a1,$t9,$s0
    	jal     set_pixel

    # draw [-x,-y]
    	sub     $a0,$t8,$s0
    	sub     $a1,$t9,$s1
    	jal     set_pixel

    # draw [-y,-x]
    	sub     $a0,$t8,$s1
    	sub     $a1,$t9,$s0
    	jal     set_pixel

    # draw [+x,-y]
    	add     $a0,$t8,$s0
    	sub     $a1,$t9,$s1
    	jal     set_pixel

    # draw [+y,-x]
    	sub     $a0,$t8,$s1
    	add     $a1,$t9,$s0
    	jal     set_pixel

    	lw      $ra,0($sp)	# trả về giá trị của lời gọi hàm draw8
    	addi    $sp,$sp,4
    	jr      $ra

# set_pixel -- draw pixel on display
#
# arguments:
#   a0 -- ( tọa độ x)	
#   a1 -- ( tọa độ y)
#
# clobbers:
#   v0 -- bitmap offset/index
#   v1 -- bitmap address
# trace:
#   v0,a0
set_pixel:
    	lw      $v0,dpy_width           # off = display width
   	mul     $v0,$a1,$v0             # off = y * width
    	add     $v0,$v0,$a0             # off += x
    	sll     $v0,$v0,2               # convert to offset
    	lw      $v1,dpy_base            # ptr = display base address
    	add     $v1,$v1,$v0             # ptr += off
    	move    $v0, $a2                # color
    	sw      $v0,($v1)               # store pixel
    	jr      $ra
