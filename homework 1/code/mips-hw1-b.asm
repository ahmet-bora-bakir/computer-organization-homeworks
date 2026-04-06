.data
x1: .word 150
x2: .word -60
x3: .word -45
x4: .word -15

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, 150
	addi $t1, $0, -60
	addi $t2, $0, -45
	addi $t3, $0, -15
	
	add $t4, $t0, $t1
	add $t5, $t2, $t4
	add $t6, $t3, $t5
	
	#version 2
	li $t0, 150
	li $t1, -60
	li $t2, -45
	li $t3, -15
	
	add $t4, $t0, $t1
	add $t5, $t2, $t4
	add $t6, $t3, $t5
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	
	add $t4, $t0, $t1
	add $t5, $t2, $t4
	add $t6, $t3, $t5
	
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
	