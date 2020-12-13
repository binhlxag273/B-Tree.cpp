.data
kytu_1: .asciiz"Nhap ky tu thu nhat: "
kytu_2: .asciiz"\nNhap ky tu thu hai: "
part_result_1: .asciiz"\nCac ky tu tu "
part_result_2: .asciiz" den "
part_result_3: .asciiz": "
part_result_4: .asciiz" "
.text
main:
la $a0, kytu_1
li $v0, 4
syscall

li $v0, 12
syscall
move $t0, $v0

la $a0, kytu_2
li $v0, 4
syscall

li $v0, 12
syscall
move $t1, $v0

la $a0, part_result_1
li $v0, 4
syscall

ori $a0, $t0, 0
li $v0, 11
syscall

la $a0, part_result_2
li $v0, 4
syscall

ori $a0, $t1, 0
li $v0, 11
syscall

la $a0, part_result_3
li $v0, 4
syscall

bgt $t0, $t1, true
false:
j loop

true:
move $t2, $t0
move $t0, $t1
move $t1, $t2

loop:
bgt $t0, $t1, exit
ori $a0, $t0, 0
li $v0, 11
syscall
la $a0, part_result_4
li $v0,4
syscall

addi $t0, $t0, 1
j loop

exit:
li $v0, 10
syscall
