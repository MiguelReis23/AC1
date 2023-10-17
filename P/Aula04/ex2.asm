#Mapa de registos
#num=$t0
#p=$t1
#*p=$t2
	.data
str:	.space 21
	.eqv read_str,8
	.eqv print_int10,1
	.text
	.globl main
main:			#int main(void){
	li $t0,0	#num=0;
	li $v0,read_str
	la $a0,str
	li $a1,20
	syscall		#read_string(str, SIZE)
	la $t1,str	#p=str;

while:				#while(){
	lb $t2,0($t1)		#*p
	beq $t2,$0,endw		#if(*p=='\0') break;
if:			
	blt $t2,'0',endif	
	bgt $t2,'9',endif	#if( (*p >= '0') && (*p <= '9') )
	addi $t0,$t0,1		#num++;		
endif:
	addi $t1,$t1,1		#p++;
	j while			#}
endw:
	li $v0,print_int10
	move $a0,$t0		
	syscall			#print_int10(num);
	li $v0,0
	jr $ra