#(15 + 25) - (9 + 4 - 2)
.data 
x1: .word 15
x2: .word 25
x3: .word 9
x4: .word 4
x5: .word 2

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, 15
	addi $t1, $0, 25
	addi $t2, $0, 9
	addi $t3, $0, 4
	addi $t4, $0, 2
	
	add $t5, $t0, $t1
	add $t6, $t2, $t3	 # 9 + 4
	sub $t7, $t6, $t4	 # 9 + 4 - 2
	sub $t8, $t5, $t7
	
	#version 2
	li $t0, 15
	li $t1, 25
	li $t2, 9
	li $t3, 4
	li $t4, 2
	
	add $t5, $t0, $t1
	add $t6, $t2, $t3	 # 9 + 4
	sub $t7, $t6, $t4	 # 9 + 4 - 2
	sub $t8, $t5, $t7
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	lw $t4, 16($at)
	
	add $t5, $t0, $t1
	add $t6, $t2, $t3	 # 9 + 4
	sub $t7, $t6, $t4	 # 9 + 4 - 2
	sub $t8, $t5, $t7
	
	sw $t8, 20($at)
	
	#version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	lw $t4, x5
	
	add $t5, $t0, $t1
	add $t6, $t2, $t3	 # 9 + 4
	sub $t7, $t6, $t4	 # 9 + 4 - 2
	sub $t8, $t5, $t7
	
	sw $t8, res
	
	li $v0, 10
	syscall