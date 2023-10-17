#Mapa de registos:
#value=$t0
#bit=$t1
#i=$t2
	.data
str1:	.asciiz "Introduza um numero: "		
str2:	.asciiz "\n O valor em binario e: "
	.eqv print_char,11
	.eqv print_str,4
	.eqv read_int,5
	.text
	.globl main
main:	
	li $v0,print_str		
	la $a0,str1			
	syscall			#print_string("Introduza um numero: ")
	li $v0,read_int
	move $t0,$v0		#value= read_int()
	
	li $v0,print_str		
	la $a0,str2			
	syscall			#print_string("\n O valor em binario e: ")
	li $t2,0		#i=0
for:	
	bge $t2,32,endfor	#for (i<32){
	li $t3,0x80000000	
	and $t1,$t0,$t3	#bit = value & 0x80000000
if:	
	bne $t2,0,else		#if(bit!=0)
	li $v0,print_char
	li $a0,'1'
	syscall			#print_char('1');
	j endif
else:
	li $v0,print_char
	li $a0,'0'
	syscall			#print_char('0');

endif:
	sll $t0,$t0,1		#value = value << 1;
	addi $t2,$t2,1		#i++
	j for			#}
endfor:
	li $v0,0
	jr $ra