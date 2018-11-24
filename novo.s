.data
	# declaraçao de um vetor de 3 posiçoes char
	vet: .byte '1', '|','2', '|', '3', '\n', '-', '+','-', '+', '-', '\n', '4', '|','5', '|', '6', '\n', '-', '+','-', '+', '-', '\n', '7', '|','8', '|', '9', '\n'
	msg1:   .asciiz "\nDigite uma posicao (int): "
	matrix: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
	fim: .asciiz "Fim de Jogo."
	XGanha: .asciiz "X Ganhou"
	OGanha: .asciiz "O Ganhou"
	ocupado: .asciiz "Posição ocupada"
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

PLAYER:
	li $t9, 0
	#ESCREVER POSICAO
	li $v0, 4   
	la $a0, msg1
	syscall
	#LER POSICAO
	li $v0, 5
	syscall
	move $t2, $v0
	la $t1, matrix
	j ESCREVER_VETOR_INTEIRO


MUDAR:
	bnez $a0, ERRO
	#addi $a0, $a0, $t2
	j ROTA

ERRO_OCUPADO:
	li $v0, 4   
	la $a0, ocupado
	syscall
	j END
	
ESCREVER_VETOR_INTEIRO:
	addi $t3, $t3, 1 # incrementando contador t3
	addi $t1,$t1, 4 # incrementando endereço vetor
	bne $t2, $t3 ESCREVER_VETOR_INTEIRO #t2 = valor digitado, t3 = contador
	lw $s3, ($t1) #carregando endereço do vetor pra reg s3
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
	bnez 0($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO1
	#MUDA O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 0($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO1:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 0($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

SEGUNDO:
	bnez 2($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO2
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 2($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO2:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 2($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

TERCEIRO:
	bnez 4($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO3
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 4($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO3:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 4($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

QUARTO:
	bnez 12($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO4
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 12($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO4:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 12($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

QUINTO:
	bnez 14($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO5
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 14($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO5:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 14($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

SEXTO:
	bnez 16($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO6
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 16($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO6:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 16($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

SETIMO:
	bnez 24($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO7
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 24($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO7:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 24($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

OITAVO:
	bnez 26($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO8
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 26($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO8:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 26($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

NONO:
	bnez 28($t1), ERRO_OCUPADO #TESTA SE A POSICAO ESTA OCUPADA
	beq $t7, 0, ADDO9
	#MUDAR O VALOR DO X
		li $s4, 'x' # carrega o char 'x' no registrador s4
		sb $s4, 28($t1) #salvar reg s4 = 'X' no vetor t1 = vet
		j COMECO

	ADDO9:
		li $s4, 'o' # carrega o char 'o' no registrador s4 
		sb $s4, 28($t1) #salvar reg s4 = 'O' no vetor t1 = vet
		j COMECO

END:
	li $v0, 4   
	la $a0, fim
	syscall
	li $v0, 10 		# terminate program
	syscall

