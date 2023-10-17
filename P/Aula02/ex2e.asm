	.data
	.text	
	.globl main
	
main: 	li $t0,7		#$t0=gray
	move $t1,$t0		#num=gray
	srl $t1,$t1,4		#(num>>4)
	xor $t1,$t1,$t0		#num=num^(num>>4)
	srl $t2,$t1,2		#bin=num>>2
	xor $t1,$t2,$t1		#num= num ^ num>>2
	srl $t2,$t1,1		#bin=num>>1
	xor $t1,$t2,$t1		#num= num ^ num>>1
	move $t2,$t1		#bin=num
	
	jr $ra
	
	
