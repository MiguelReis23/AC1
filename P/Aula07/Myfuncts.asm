	.text
	
strlen: 	li $v0,0		#len=0
strl_while:	lb $t0,0($a0)	#$t0=*s
	addiu $a0,$a0,1	#*s++
	beq $t0,'\0',strl_endw	#{
	addi $v0,$v0,1	#len++
	j strl_while		#}
strl_endw:	move $v0,$v0		#return len
	jr $ra
	
	
	
	
# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)

exchange:					#void exchange(char *, char *){
	lb $t0,0($a0)
	lb $t1,0($a1)			#char aux = *c1;
	sb $t0,0($a1)			#*c1 = *c2;
	sb $t1,0($a0)			#*c2 = aux;
	jr $ra				#}
	

strrev:					#char *strrev(char*str)
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $a0,12($sp)			#prologo
	move $s0,$a0
	move $s1,$a0
strr_while1:			#while(1){
	lb $t0,0($s1)
	beq $t0,'\0',strr_endw1	#if(*p2==0) break;
	addiu $s1,$s1,1		#p2++;	
	j strr_while1		#}
strr_endw1:
	addiu $s1,$s1,-1		#p2--;
strr_while2:
	bgeu $s0,$s1,strr_endw2	#while(p1<p2){
	move $a0,$s0
	move $a1,$s1
	jal exchange
	addiu $s0,$s0,1		#p1++;
	addiu $s1,$s1,-1		#p2--;
	j strr_while2		#}		
strr_endw2:	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $v0,12($sp)
	addiu $sp,$sp,16			#epílogo
	jr $ra