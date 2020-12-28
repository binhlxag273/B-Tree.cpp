.data
str1: .asciiz"Nhap n: "
str2: .asciiz"[ "
str3: .asciiz" ] = "
str4: .asciiz"\nMang vua nhap: "
arr: .space 40 # 10 element integer array, each element has 8 bit

.text
main:
la $a0, str1
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0 # $t0 : so luong phan tu

la $s0, arr # $s0 : address of arr
li $s1, 0 # $s1 : address of arr[index]
li $s2, 0 # $s2 : index
li $t1, 0 # $t1 : iteration of i, begin with 0

loop:
beq $t1, $t0, exit_loop

la $a0, str2
li $v0, 4
syscall
#
move $a0, $t1
li $v0, 1
syscall
addi $t1, $t1, 1
#
la $a0, str3
li $v0, 4
syscall
#
li $v0, 5
syscall
add $s1, $s0, $s2
sb $v0, 0($s1)
addi $s2, $s2, 1
j loop

exit_loop:

la $a0, str4
li $v0, 4
syscall

li $s1, 0 # $s1 : address of arr[index]
li $s2, 0 # $s2 : index
li $t1, 0 # $t1 : iteration of i, begin with 0

print_loop:
beq $t1, $t0, end
add $s1, $s0, $s2
lb $a0, 0($s1)
addi $s2, $s2, 1


li $v0, 1
syscall
li $a0, 32
li $v0, 11
syscall

addi $t1, $t1, 1
j print_loop

end:
li $v0, 10
syscall
