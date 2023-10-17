	.data
	.eqv valor,0x12345678
	.eqv nbits,1
	.text
	.globl main
main:	li $t0,valor

	sll $t2,$t0,nbits
	srl $t3,$t0,nbits
	sra $t4,$t0,nbits
	
	jr $ra