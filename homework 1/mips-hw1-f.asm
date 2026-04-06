#(45 & 25) ^ (~10 | 2)
.data
x1: .word 45
x2: .word 25
x3: .word 10
x4: .word 2

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, 45
	addi $t1, $0, 25
	addi $t2, $0, 10
	addi $t3, $0, 2
	
	and $t4, $t0, $t1
	nor $t5, $t2, $t2	#to make 10 to ~10
	or $t6, $t5, $t3
	xor $t7, $t4, $t6
	
	#version 2
	li $t0, 45
	li $t1, 25
	li $t2, 10
	li $t3, 2
	
	and $t4, $t0, $t1
	nor $t5, $t2, $t2	#to make 10 to ~10
	or $t6, $t5, $t3
	xor $t7, $t4, $t6
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	
	and $t4, $t0, $t1
	nor $t5, $t2, $t2	#to make 10 to ~10
	or $t6, $t5, $t3
	xor $t7, $t4, $t6
	
	sw $t7, 16($at)
	
	# version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	
	and $t4, $t0, $t1
	nor $t5, $t2, $t2	#to make 10 to ~10
	or $t6, $t5, $t3
	xor $t7, $t4, $t6
	
	sw $t7, res

	li $v0, 10
	syscall
	