#(-15) - (60 - (20 - (45 - 5)))
.data 
x1: .word -15
x2: .word 60
x3: .word 20
x4: .word 45
x5: .word -5

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, -15
	addi $t1, $0, 60
	addi $t2, $0, 20
	addi $t3, $0, 45
	addi $t4, $0, -5
	
	add $t5, $t3, $t4
	sub $t6, $t2, $t5	 
	sub $t7, $t1, $t6	
	sub $t8, $t0, $t7
	
	#version 2
	li $t0, -15
	li $t1, 60
	li $t2, 20
	li $t3, 45
	li $t4, -5
	
	add $t5, $t3, $t4
	sub $t6, $t2, $t5	 
	sub $t7, $t1, $t6	
	sub $t8, $t0, $t7
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	lw $t4, 16($at)
	
	add $t5, $t3, $t4
	sub $t6, $t2, $t5	 
	sub $t7, $t1, $t6	
	sub $t8, $t0, $t7
	
	sw $t8, 20($at)
	
	#version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	lw $t4, x5
	
	add $t5, $t3, $t4
	sub $t6, $t2, $t5	 
	sub $t7, $t1, $t6	
	sub $t8, $t0, $t7
	
	sw $t8, res
	
	li $v0, 10
	syscall