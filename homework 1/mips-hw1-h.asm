#(0x5A & 0xFF) | ((0xC3 & 0x0F) ^ 0x0B)
.data 
x1: .word 0x5A
x2: .word 0xFF
x3: .word 0xC3
x4: .word 0x0F
x5: .word 0x0B

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, 0x5A
	addi $t1, $0, 0xFF
	addi $t2, $0, 0xC3
	addi $t3, $0, 0x0F
	addi $t4, $0, 0x0B
	
	and $t5, $t0, $t1
	and $t6, $t2, $t3	 
	xor $t7, $t4, $t6	
	or $t8, $t5, $t7
	
	#version 2
	li $t0, 0x5A
	li $t1, 0xFF
	li $t2, 0xC3
	li $t3, 0x0F
	li $t4, 0x0B
	
	and $t5, $t0, $t1
	and $t6, $t2, $t3	 
	xor $t7, $t4, $t6	
	or $t8, $t5, $t7
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	lw $t4, 16($at)
	
	and $t5, $t0, $t1
	and $t6, $t2, $t3	 
	xor $t7, $t4, $t6	
	or $t8, $t5, $t7
	
	sw $t8, 20($at)
	
	#version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	lw $t4, x5
	
	and $t5, $t0, $t1
	and $t6, $t2, $t3	 
	xor $t7, $t4, $t6	
	or $t8, $t5, $t7
	
	sw $t8, res
	
	li $v0, 10
	syscall