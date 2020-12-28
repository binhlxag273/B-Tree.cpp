.data
str1: .asciiz"Nhap so phan tu N cua mang: "
str2: .asciiz"\nNhap cac phan tu cua mang: "
str3: .asciiz"\nNhap phan tu M can tim: "
str4: .asciiz"\nXuat: "
str5: .asciiz" duoc tim thay trong mang"
str6: .asciiz" khong duoc tim thay trong mang"
arr: .space 40
.text
la $a0, str1
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $a0, str2
li $v0, 4
syscall

la $s0, arr

li $s1, 0
li $s2, 0
li $t1, 0

loop:
beq $t1, $t0, exit_loop
li $v0, 5
syscall

add $s1, $s0, $s2
sb $v0, 0($s1)
addi $s2, $s2, 1

addi $t1, $t1, 1
j loop
exit_loop:

la $a0, str3
li $v0, 4
syscall

li $v0, 5
syscall
move $t2, $v0

la $a0, str4
li $v0, 4
syscall

move $a0, $t2
li $v0,1
syscall

li $s1, 0
li $s2, 0
li $t1, 0

check_loop:
beq $t1, $t0, end_check

add $s1, $s0, $s2
lb $t3, 0($s1)
addi $s2, $s2, 1

beq $t3, $t2, contain
j next
contain:
la $a0, str5
li $v0, 4
syscall
li $v0, 10
syscall

next:
addi $t1, $t1, 1
j check_loop
end_check:
la $a0, str6
li $v0, 4
syscall

end:
li $v0, 10
syscall
