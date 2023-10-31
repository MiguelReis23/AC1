#Mapa registos:
#i=$t0
#houveTroca=$t3
#aux=$t4
#lista=$t1
#lista+i=$t2
	.data
str:	.asciiz "\nIntroduza um numero: "
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
	.eqv print_str,4
	.eqv read_int,5
	.eqv print_int10,1
lista:	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
	.align 2
	.space 40
	.text
	.globl main
main:				#int main(void){
	li $t0,0x8ff1f		#i=0;
while:	bge $t0,SIZE,endw	#while(i<10){
	la $a0,str		
	li $v0,print_str
	syscall			#print_string(str);
	li $v0,read_int		
	syscall			#int tmp=read_int()
	la $t1,lista
	sll $t2,$t0,2		#int tmp1=i*4
	addu $t2,$t1,$t2	#($t2)= &(lista[i])
	sw $v0,0($t2)		#lista[i]= read_int() ;
	addi $t0,$t0,1		#i++
	j while			#}
endw:

while2:	
	li $t3,FALSE		#houveTroca = FALSE;
	li $t0,0		#i=0
while3:
	bge $t0,9,endw3		#while(i<size-1){
	la $t1,lista
	sll $t2,$t0,2		#int tmp1=i*4
	addu $t2,$t1,$t2	#($t2)= &(lista[i])
	lw $t5,0($t2)		#t5= lista[i]
	lw $t6,4($t2)		#t6= lista[i+1]
if:	ble $t4,$t5,endif	#if(lista[i]<= lista[i+1]) break;
	move $t4,$t5		#aux = lista[i];
	move $t5,$t6		#lista[i] = lista[i+1];
	move $t6,$t4		#lista[i+1] = aux;
	li $t3,TRUE
	
endif:
	addi $t0,$t0,1 		#i++
	j while3
endw3:
	bne $t3,TRUE,endw2			#while($t3== TRUE)	
	j while2
endw2:
	la $t0,lista		#p = lista;
	
	li $t2,SIZE
	sll $t2,$t2,2
	addu $t2,$t2,$t0	#t2=lista+SIZE
	
	li $v0,print_str
	la $a0,str1
	syscall			#print_string("\nConteudo do array:\n");
	
while4:	bge $t0,$t2,endw4	#while(p<lista+SIZE)
	
	lw $t1,0($t0)		#$t1=*p
	li $v0,print_int10
	move $a0,$t1
	syscall			#print_int10( *p );
	li $v0,print_str
	la $a0,str1	
	syscall			#print_string("; ");
	addiu $t0,$t0,4		#p++
	j while4
endw4:
	li $v0,0
	jr $ra				#}
