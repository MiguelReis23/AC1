#Mapa Registos
#t0=i
#t1=p
#t2=pultimo
#t3=*p
	.data
	.eqv SIZE, 3
	.eqv print_str,4
	.eqv print_char,11
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1,str2,str3
	.text
	.globl main
main:	
	la $t1, array		# p =&array[0];
	li $t4, SIZE
	sll $t4, $t4, 2
	addu $t2, $t1, $t4		#pultimo= array+SIZE
while:	bge $t1, $t2, endw		#while(p<pultimo)
	lw $t3, 0($t1)		#*p
	move $a0, $t3
	li $v0, print_str
	syscall			#print_str(**p)
	li $a0, '\n'	
	li $v0,print_char
	syscall			#print_char('\n')
	addi $t1,$t1,4		#p++
	j while
endw:
	li $v0,0
	jr $ra