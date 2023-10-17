#Mapa registos
#i=$t0
#lista=$t1
#lista+i=$t2
	.data
	.eqv SIZE,5
str:	.asciiz "\nIntroduza um numero: "
	.align 2
lista:	.space 20
	.eqv print_str,4
	.eqv read_int,5
	.text
	.globl main
main:				#int main(void){
	li $t0,0		#i=0;
while:	bge $t0,SIZE,endw	#while(i<5){
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
	li $v0,0
	jr $ra			#}