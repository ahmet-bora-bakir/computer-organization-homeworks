#question a)

# expression 'a' using the methods

.data
x1: .word 12 
x2: .word 22
x3: .word 32
x4: .word 42 
res: .word 0

.text
main:
	# version 1
	addi $t0, $0, 12
	addi $t1, $0, 22
	addi $t2, $0, 32
	addi $t3, $0, 42
	add $t4, $t0, $t1		
	add $t5, $t2, $t3
	add $t6, $t4, $t5
	
	# version 2
	li $t0, 12
	li $t1, 22
	li $t2, 32
	li $t3, 42
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $s1, $t4, $t5
	
	# version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $t6, $t4, $t5
	sw $t6, 16($at)

	# version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $s1, $t4, $t5 
	sw $s1, res

	li $v0, 10
	syscall