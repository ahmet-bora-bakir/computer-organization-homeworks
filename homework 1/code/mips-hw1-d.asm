#(-30) + (-10) - ((-8) - (-12) + 25)
.data 
x1: .word -30
x2: .word -10
x3: .word -8
x4: .word -12
x5: .word 25

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, -30
	addi $t1, $0, -10
	addi $t2, $0, -8
	addi $t3, $0, -12
	addi $t4, $0, 25
	
	add $t5, $t0, $t1
	sub $t6, $t2, $t3	 
	add $t7, $t6, $t4	
	sub $t8, $t5, $t7
	
	#version 2
	li $t0, -30
	li $t1, -10
	li $t2, -8
	li $t3, -12
	li $t4, 25
	
	add $t5, $t0, $t1
	sub $t6, $t2, $t3	 
	add $t7, $t6, $t4	
	sub $t8, $t5, $t7
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	lw $t4, 16($at)
	
	add $t5, $t0, $t1
	sub $t6, $t2, $t3	 
	add $t7, $t6, $t4	
	sub $t8, $t5, $t7
	
	sw $t8, 20($at)
	
	#version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	lw $t4, x5
	
	add $t5, $t0, $t1
	sub $t6, $t2, $t3	 
	add $t7, $t6, $t4	
	sub $t8, $t5, $t7
	
	sw $t8, res
	
	li $v0, 10
	syscall