#Mapa Registos
#i=$t0
#array=$t1
#array[i]=$t2
	.data
	.eqv SIZE,3
	.eqv print_str,4
	.eqv print_char,11
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1,str2,str3
	.text
	.globl main
main:	li $t0, 0			#i=0;
for:	la $t1,array		#$t1=&array[0]
	bge $t0,SIZE,endfor		#for(i<SIZE){
	sll $t3,$t0,2		#i*4
	addu $t1,$t1,$t3		#&array[i]
	lw $t2,0($t1)		#$t2=array[i]
	move $a0,$t2		
	li $v0,print_str		
	syscall			#print_string(array[i]);
	li $a0,'\n'
	li $v0,print_char
	syscall			#print_char('\n');
	addi $t0,$t0,1		#i++
	j for
endfor:
	li $v0,0
	jr $ra