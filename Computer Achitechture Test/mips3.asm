.data
str_input: .space 16
str_output: .space 16
nhap_chuoi: .asciiz"Nhap vao mot chuoi: "
nhap_ky_tu: .asciiz"\nNhap vao mot ky tu: "
contain_true: .asciiz"\nChuoi sau khi xoa ky tu: "
part_contain_false_1: .asciiz"\nKet qua: "
part_contain_false_2: .asciiz" khong co trong chuoi"
.text
main:
la $a0, nhap_chuoi
li $v0, 4
syscall

la $a0, str_input
li $a1, 16
move $s0, $a0 # s0: address of input string
li $v0, 8
syscall

la $a0, nhap_ky_tu
li $v0, 4
syscall

li $v0, 12
syscall
move $t0, $v0 # $t0: character

la $s1, str_output # $s1: address of output string
li $t1, 0 # $t1 = i: iteration of input string, starting at 0
li $t2, 0 # $t2 = j: iteration of output string, starting at 0
li $t3, 0 # if $t3 = 1 input string contain character, otherwise it doesn't contain

loop:
add $s2, $s0, $t1 # s2: address of input_str[i]
lb $s3, 0($s2) # s3: current character
beq $s3, $zero, exit #exit loop if it reach the end of input string
bne $s3, $t0, true # compare two character
false:
li $t3, 1
j continue_loop
true:
add $s4, $s1, $t2 # s4: address of output_str[j]
sb $s3, 0($s4)
addi $t2, $t2, 1

continue_loop:
addi $t1, $t1, 1
j loop

exit:
beq $t3, $zero, print_not_contained
print_contained:
la $a0, contain_true
li $v0, 4
syscall

la $a0, str_output
li $v0, 4
syscall
j end

print_not_contained:
la $a0, part_contain_false_1
li $v0, 4
syscall

move $a0, $t0
li $v0, 11
syscall

la $a0, part_contain_false_2
li $v0, 4
syscall

end:
li $v0, 10
syscall
