	.data
	.text	
	.globl main
	
main: 
	li $t0,4		#t0= x  bin=x
	srl $t2,$t0,1		#$t2=$t0 >>1	(bin>>1)
	xor $t1,$t0,$t2		#$t1= $t0 ^ $t2	(bin ^ bin >>1)
	
	jr $ra