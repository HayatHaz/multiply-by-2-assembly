.data

enter1: .asciiz "Enter number of elemnets: "
enter2: .asciiz "Enter the numbers: "
wrong: .asciiz "WRONG! try again: "
result: .asciiz "nummbers x2 : "
space: .asciiz "\n"
tspace: .asciiz " "
arr: .word 5


.text
main:

la $a0, enter1
li $v0, 4
syscall


loop:

li $v0, 5
syscall

bgtz $v0, exitloop

la $a0, space
li $v0, 4
syscall

la $a0, wrong
li $v0, 4
syscall

j loop

exitloop:
la $a0, space
li $v0, 4
syscall

move $s2, $v0
la $a0, enter2
li $v0, 4
syscall


la $s0, arr
jal readArray

la $a0, space
li $v0, 4
syscall

la $a0, result
li $v0, 4
syscall

la $s0, arr
jal displyPower2







#############################
readArray:

li $t0, 0

loop1:

beq $t0, $s2, exit1


li $v0, 5
syscall

sw $v0, 0($s0)

addi $t0, $t0, 1
addi $s0, $s0, 4

j loop1

exit1: jr $ra


#############################
displyPower2:

li $t0, 0

loop2:

beq $t0, $s2, exit2

lw $s1, 0($s0)

add $s1, $s1, $s1

move $a0, $s1
li $v0, 1
syscall

la $a0, tspace
li $v0, 4
syscall

addi $t0, $t0, 1
addi $s0, $s0, 4

j loop2

exit2: 
li $v0, 10
syscall





























 