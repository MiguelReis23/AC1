#Mapa registos
#p= $t0
#*p=$t1
#lista+SIZE= $t2
	.data
	.eqv print_str,4
	.eqv print_int10,1
	.eqv SIZE,10
str:	.asciiz "\nConteudo do array:\n"
str1:	.asciiz "; "
lista:	.word 8,-4,3,5,124,-15,87,9,27,15
	.text
	.globl main
main:			#int main(void){
	la $t0,lista		#p = lista;
	
	li $t2,SIZE
	sll $t2,$t2,2
	addu $t2,$t2,$t0	#t2=lista+SIZE
	
	li $v0,print_str
	la $a0,str
	syscall			#print_string("\nConteudo do array:\n");
	
while:	bge $t0,$t2,endw	#while(p<lista+SIZE)
	
	lw $t1,0($t0)		#$t1=*p
	li $v0,print_int10
	move $a0,$t1
	syscall			#print_int10( *p );
	li $v0,print_str
	la $a0,str1	
	syscall			#print_string("; ");
	addiu $t0,$t0,4		#p++
	j while
endw:
	li $v0,0
	jr $ra			#}
