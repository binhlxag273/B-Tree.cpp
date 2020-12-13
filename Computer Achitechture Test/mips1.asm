.data
nhapN: .asciiz "Nhap N: "
nhapM: .asciiz "\nNhap M: "
ketqua: .asciiz "\nKet qua: "
.text
main:
la $a0, nhapN
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $a0, nhapM
li $v0, 4
syscall

li $v0, 5
syscall
move $t1, $v0

la $a0, ketqua
li $v0, 4
syscall

bgt $t0, $t1, greater
lower:
j exit

greater:
move $t2, $t0
move $t0, $t1
move $t1, $t2

exit:
li $a0, 0

loop:
bgt $t0, $t1, true
false:
add $a0, $a0, $t0
addi $t0, $t0, 1
j loop

true:
li $v0, 1
syscall

li $v0, 10
syscall
