.data
	# declaraçao de um vetor de 3 posiçoes char
	vet: .byte '1', '|','2', '|', '3', 10, '-', '+','-', '+', '-', 10, '4', '|','5', '|', '6', 10, '-', '+','-', '+', '-', 10, '7', '|','8', '|', '9', 10
	msg1:   .asciiz "\nDigite uma posicao (int): "
	matrix: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #tem 10 posições porque com 9 bugava
	fim: .asciiz "Fim de Jogo."
	XGanha: .asciiz "X Ganhou"
	OGanha: .asciiz "O Ganhou"
	ocupado: .asciiz "Posição ocupada.\nDigite outro valor (int): "
	invalido: .asciiz "Posição invalida.\nDigite outro valor (int): "
	debug: .asciiz "AQUI"
	.text
.globl main
main: 
	la $t0,vet		# carrega o ponteiro do vetor

# laço de leitura da memoria 	
	CONST=30 			# parametro de parada do laço
	i=0
	PRINT_CHAR=11		# codigo da chamada de sistema
	PRINT_STR=4
	X = 3
	O = 5
	li $t7, 0

COMECO:	
	li $t8, 0
	li $t9, 0 			# t9 é o contador (i)
	la $t1, vet		#carrega o endereço

	# $t7 = TESTE SE É A VEZ DO X OU DO O

DESENHA:
	beq $t9, CONST, ROTA 	# testa a condiçao
	lb $a0, ($t1) 			# carrega o char da memoria
	li $v0, PRINT_CHAR		# char deve estar em $a0
	syscall
	addi $t9, $t9, 1	# incremento do i  
	addi $t1,$t1, 1		# incrementa o endereço
	j DESENHA

ROTA:
	addi $t8, $t8, 1
	addi $t7, $t7, 1 #incrementa o t7
	rem $t7, $t7, 2 # t7 = t7 % 2, retorna 0 ou 1
	beq $t8, 1, PLAYER

PLAYER: #PEDE PRA O PLAYER DIGITAR A POSICAO
	li $t9, 0
	#ESCREVER POSICAO
	li $v0, 4   
	la $a0, msg1
	syscall
	#LER POSICAO
	li $v0, 5
	syscall
	move $t2, $v0
	li $t3, 0 #Zera o contador t3
	la $t1, matrix
	bge $t2, 10, ERRO_POSICAO_INVALIDA
	blt $t2, 1, ERRO_POSICAO_INVALIDA
	j ESCREVER_VETOR_INTEIRO


MUDAR:
	bnez $a0, ERRO_OCUPADO
	#addi $a0, $a0, $t2
	j ROTA

ERRO_POSICAO_INVALIDA:
	li $v0, 4   
	la $a0, invalido
	syscall
	j PLAYER

ERRO_OCUPADO:
	li $v0, 4   
	la $a0, ocupado
	syscall
	j PLAYER
	
ESCREVER_VETOR_INTEIRO:
	addi $t3, $t3, 1 # incrementando contador t3
	addi $t1,$t1, 4 # incrementando endereço vetor
	bne $t2, $t3 ESCREVER_VETOR_INTEIRO #t2 = valor digitado, t3 = contador
	lw $s3, ($t1) #carregando endereço do vetor pra reg s3
	bnez $s3, ERRO_OCUPADO #check se a posição está ocupada
	bnez $t7, ADDX

	ADDX:
		addi $s3, $s3, X #adiciona no valor
		sw $s3, ($t1) #salvar reg s3 no vetor t1
		j CHECAR_VETOR_CHAR

	ADDO:
		addi $s3, $s3, O #adiciona no valor
		sw $s3, ($t1) #salvar reg s3 no vetor t1
		j CHECAR_VETOR_CHAR


CHECAR_VETOR_CHAR:
	la $t1, vet		#carrega o endereço do vet para o reg t1
	beq $t2, 1, PRIMEIRO # t2 = valor digitado
	beq $t2, 2, SEGUNDO # t2 = valor digitado
	beq $t2, 3, TERCEIRO # t2 = valor digitado
	beq $t2, 4, QUARTO # t2 = valor digitado
	beq $t2, 5, QUINTO # t2 = valor digitado
	beq $t2, 6, SEXTO # t2 = valor digitado
	beq $t2, 7, SETIMO # t2 = valor digitado
	beq $t2, 8, OITAVO # t2 = valor digitado
	beq $t2, 9, NONO # t2 = valor digitado

PRIMEIRO:
	beq $t7, 0, ADDO1
	#MUDA O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 0($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO1:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 0($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

SEGUNDO:
	beq $t7, 0, ADDO2
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 2($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO2:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 2($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

TERCEIRO:
	beq $t7, 0, ADDO3
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 4($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO3:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 4($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

QUARTO:
	beq $t7, 0, ADDO4
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 12($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO4:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 12($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

QUINTO:
	beq $t7, 0, ADDO5

	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 14($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO5:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 14($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

SEXTO:
	beq $t7, 0, ADDO6
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 16($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO6:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 16($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

SETIMO:
	beq $t7, 0, ADDO7
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 24($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO7:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 24($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

OITAVO:
	beq $t7, 0, ADDO8
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 26($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO8:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 26($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

NONO:
	beq $t7, 0, ADDO9
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 28($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j VERIFICA_VENCEDOR

	ADDO9:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 28($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j VERIFICA_VENCEDOR

VERIFICA_VENCEDOR:
	li $s5, 0 #carrega s5 = 0
	li $s6, 0 #carrega s6 = 0
	li $s7, 0 #carrega s7 = 0
	la $t1, matrix
	#Checa as linhas
	#Linha 1
	lw $s5, ($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Coluna 1
	lw $s5, ($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Diagonal 1
	lw $s5, ($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 15, O_GANHOU
	beq $s7, 9, X_GANHOU
	#Verifica empate
	lw $s5, ($t1)
	lw $s6, 4($t1)
	add $s6, $s6, $s5
	lw $s5, 8($t1)
	add $s6, $s6, $s5
	lw $s5, 12($t1)
	add $s6, $s6, $s5
	lw $s5, 16($t1)
	add $s6, $s6, $s5
	lw $s5, 20($t1)
	add $s6, $s6, $s5
	lw $s5, 24($t1)
	add $s6, $s6, $s5
	lw $s5, 28($t1)
	add $s6, $s6, $s5
	lw $s5, 32($t1)
	add $s6, $s6, $s5
	beq $s6, 32, END 

	j COMECO #se ninguem ganhou

O_GANHOU:
	li $v0, 4   
	la $a0, OGanha
	syscall
	li $v0, 10 		# terminate program
	syscall

X_GANHOU:
	li $v0, 4   
	la $a0, XGanha
	syscall
	li $v0, 10 		# terminate program
	syscall

END:
	li $v0, 4   
	la $a0, fim
	syscall
	li $v0, 10 		# terminate program
	syscall

##DEBUGER
#li $v0, 4   
#la $a0, debug
#syscall
