	.data
	.text
	.globl main
main:	ori $t0,$0,0x0F1E 	#valor $t0
	ori $t1,$0,0x0000	#valor $t1
	and $t2,$t0,$t1		#$t2= $t0 & $t1 (and bit a bit)
	or $t3,$t0,$t1		#$t3= $t0 | $t1 (or bit a bit)
	nor $t4,$t0,$t1		#$t4= ~($t0 | $t1) (nor bit a bit)
	xor $t5,$t0,$t1		#$t3= $t0 ^ $t1 (xor bit a bit)
	
	jr $ra			#fim
	
	