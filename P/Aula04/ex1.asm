#Mapa registos
#num:$t0
#i:$t1
#str:$t2
#str+i: $t3
#str[i]:$t4	
	.data
str:	.space 21
	.eqv read_str,8
	.eqv print_int10,1
	.text
	.globl main
main:				#int main(void){
	li $v0,read_str	
	la $a0,str
	li $a1,20
	syscall			#read_str(str,SIZE);
	li $t0,0		#num=0;
	li $t1,0 		#i=0;
while:				#while(){
	la $t2,str
	add $t3,$t2,$t1		#	char *p= str+i;
	lb $t4,0($t3)		#	char cc= str[i];
	beq $t4,$0,endw		#	if (cc==0)break;
if:
	blt $t4,'0',endif	
	bgt $t4,'9',endif	#	if( (str[i] >= '0') && (str[i] <= '9'
	addi $t0,$t0,1		#	num++;
endif:
	addi $t1,$t1,1		#	i++;
	j while			#}
endw:
	li $v0,print_int10
	move $a0,$t0
	syscall			#print_int10(num);
	li $v0,0
	jr $ra