#~(18 | 12) & (22 | 8 | ~(~14 & 6))
.data 
x1: .word 18
x2: .word 12
x3: .word 22
x4: .word 8
x5: .word 14
x6: .word 6

res: .word 0

.text
main:
	#version 1
	addi $t0, $0, 18
	addi $t1, $0, 12
	addi $t2, $0, 22
	addi $t3, $0, 8
	addi $t4, $0, 14
	addi $t5, $0, 6
	
	or $t6, $t0, $t1
        nor $t6, $t6, $t6
        nor $t7, $t4, $t4
        and $t7, $t7, $t5
        nor $t7, $t7, $t7
        or $t8, $t2, $t3
        or $t7, $t8, $t7
        and $s0, $t6, $t7
	
	#version 2
	li $t0, 18
	li $t1, 12
	li $t2, 22
	li $t3, 8
	li $t4, 14
	li $t5, 6
	
	or $t6, $t0, $t1
        nor $t6, $t6, $t6
        nor $t7, $t4, $t4
        and $t7, $t7, $t5
        nor $t7, $t7, $t7
        or $t8, $t2, $t3
        or $t7, $t8, $t7
        and $s0, $t6, $t7
	
	#version 3
	lui $at, 0x1001
	lw $t0, 0($at)
	lw $t1, 4($at)
	lw $t2, 8($at)
	lw $t3, 12($at)
	lw $t4, 16($at)
	lw $t5, 20($at)
	
	or $t6, $t0, $t1
        nor $t6, $t6, $t6
        nor $t7, $t4, $t4
        and $t7, $t7, $t5
        nor $t7, $t7, $t7
        or $t8, $t2, $t3
        or $t7, $t8, $t7
        and $s0, $t6, $t7
	
	sw $s0, 24($at)
	
	#version 4
	lw $t0, x1
	lw $t1, x2
	lw $t2, x3
	lw $t3, x4
	lw $t4, x5
	lw $t5, x6
	
	or $t6, $t0, $t1
        nor $t6, $t6, $t6
        nor $t7, $t4, $t4
        and $t7, $t7, $t5
        nor $t7, $t7, $t7
        or $t8, $t2, $t3
        or $t7, $t8, $t7
        and $s0, $t6, $t7
	
	sw $s0, res
	
	li $v0, 10
	syscall