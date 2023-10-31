	.data
	.eqv print_int10,1
str:	.asciiz "Arquitetura de Computadores I"
	.text
	.globl main
main:	
	addiu $sp,$sp,-4
	sw $ra,0($sp)		#prólogo
	
	la $a0,str
	jal strlen		#strlen(str)
	move $a0,$v0
	li $v0,print_int10
	syscall			#print_int10(strlen(str))
	li $v0,0			# return 0;
	
	lw $ra,0($sp)
	addiu $sp,$sp,4		#epílogo
	jr $ra			#}


	.include "ex1a.asm"
	
	