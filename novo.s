#
## Trabalho feito para disciplina de Arquitetura de Computadores 1
## Autores: Diego Soria Rios e Paulo Cesar Martins Citron
#
.data
	# declaraçao de um vetor de 3 posiçoes char
	vet: .byte '1', '|','2', '|', '3', 10, '-', '+','-', '+', '-', 10, '4', '|','5', '|', '6', 10, '-', '+','-', '+', '-', 10, '7', '|','8', '|', '9', 10
	msg1:   .asciiz "\nDigite uma posicao (int): "
	matrix: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #tem 10 posições porque 0 não é usado
	empate: .asciiz "Jogo empatado.\n"
	XGanha: .asciiz "X Ganhou\n"
	OGanha: .asciiz "O Ganhou\n"
	ocupado: .asciiz "Posição ocupada.\nDigite outro valor (int): "
	invalido: .asciiz "Posição invalida.\nDigite outro valor (int): "
	debug: .asciiz "AQUI"
	limpaTela: .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	novoJogo: .asciiz "\n\nNovo Jogo\n\n"
	aceita: .asciiz "[0]Sim\t\t\t\t\t\t"
	naoAceita: .asciiz "[1]Não\n"
	digitaCerto: .asciiz "Digite uma opçao valida\n"
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
	j COMECO

INICIO:
	li $t6, 0 #contador de jogadas do jogo
	la $t1,vet		# carrega o ponteiro do vetor
	li $s4, '1' # carrega o char 'x' no registrador s4
	sb $s4, 0($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 1($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '2' # carrega o char 'x' no registrador s4
	sb $s4, 2($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 3($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '3' # carrega o char 'x' no registrador s4
	sb $s4, 4($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, 10 # carrega o char 'x' no registrador s4
	sb $s4, 5($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 6($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '+' # carrega o char 'x' no registrador s4
	sb $s4, 7($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 8($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '+' # carrega o char 'x' no registrador s4
	sb $s4, 9($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 10($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, 10 # carrega o char 'x' no registrador s4
	sb $s4, 11($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '4' # carrega o char 'x' no registrador s4
	sb $s4, 12($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 13($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '5' # carrega o char 'x' no registrador s4
	sb $s4, 14($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 15($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '6' # carrega o char 'x' no registrador s4
	sb $s4, 16($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, 10 # carrega o char 'x' no registrador s4
	sb $s4, 17($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 18($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '+' # carrega o char 'x' no registrador s4
	sb $s4, 19($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 20($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '+' # carrega o char 'x' no registrador s4
	sb $s4, 21($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '-' # carrega o char 'x' no registrador s4
	sb $s4, 22($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, 10 # carrega o char 'x' no registrador s4
	sb $s4, 23($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '7' # carrega o char 'x' no registrador s4
	sb $s4, 24($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 25($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '8' # carrega o char 'x' no registrador s4
	sb $s4, 26($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '|' # carrega o char 'x' no registrador s4
	sb $s4, 27($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, '9' # carrega o char 'x' no registrador s4
	sb $s4, 28($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	li $s4, 10 # carrega o char 'x' no registrador s4
	sb $s4, 29($t1) #salvar reg s4 = 'X' no vetor t1 = vet
	la $t1, matrix		# carrega o ponteiro do vetor
	sw $0, 0($t1)
	sw $0, 4($t1)
	sw $0, 8($t1)
	sw $0, 12($t1)
	sw $0, 16($t1)
	sw $0, 20($t1)
	sw $0, 24($t1)
	sw $0, 28($t1)
	sw $0, 32($t1)
	j COMECO

COMECO:	
	addi $t6, $t6, 1
	beq $t6, 10, EMPATE
	li $t8, 0
	li $t9, 0 			# t9 é o contador (i)
	la $t1, vet		#carrega o endereço

	# $t7 = TESTE SE É A VEZ DO X OU DO O

LIMPA_TELA:
	li $v0, 4   
	la $a0, limpaTela
	syscall

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
	beqz $t7, JOGADA_COMPUTADOR
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
	beq $t2, $t3 CARREGA_VETOR_INTEIRO #t2 = valor digitado, t3 = contador
	addi $t1,$t1, 4 # incrementando endereço vetor
	bne $t2, $t3 ESCREVER_VETOR_INTEIRO #t2 = valor digitado, t3 = contador

	CARREGA_VETOR_INTEIRO:
		lw $s3, ($t1) #carregando endereço do vetor pra reg s3
		bnez $s3, ERRO_OCUPADO #check se a posição está ocupada
		bnez $t7, ADDX

	ADDO:
		addi $s3, $s3, O #adiciona no valor
		sw $s3, ($t1) #salvar reg s3 no vetor t1
		j CHECAR_VETOR_CHAR

	ADDX:
		addi $s3, $s3, X #adiciona no valor
		sw $s3, ($t1) #salvar reg s3 no vetor t1
		j CHECAR_VETOR_CHAR


CHECAR_VETOR_CHAR:
	la $t1, vet		#carrega o endereço do vet para o reg t1
	beqz $t7, CHECAR_VETOR_CHAR_PC
	beq $t2, 1, PRIMEIRO # t2 = valor digitado
	beq $t2, 2, SEGUNDO # t2 = valor digitado
	beq $t2, 3, TERCEIRO # t2 = valor digitado
	beq $t2, 4, QUARTO # t2 = valor digitado
	beq $t2, 5, QUINTO # t2 = valor digitado
	beq $t2, 6, SEXTO # t2 = valor digitado
	beq $t2, 7, SETIMO # t2 = valor digitado
	beq $t2, 8, OITAVO # t2 = valor digitado
	beq $t2, 9, NONO # t2 = valor digitado

	CHECAR_VETOR_CHAR_PC:
	beq $s6, 1, PRIMEIRO # t2 = valor digitado
	beq $s6, 2, SEGUNDO # t2 = valor digitado
	beq $s6, 3, TERCEIRO # t2 = valor digitado
	beq $s6, 4, QUARTO # t2 = valor digitado
	beq $s6, 5, QUINTO # t2 = valor digitado
	beq $s6, 6, SEXTO # t2 = valor digitado
	beq $s6, 7, SETIMO # t2 = valor digitado
	beq $s6, 8, OITAVO # t2 = valor digitado
	beq $s6, 9, NONO # t2 = valor digitado

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
	lw $s5, 0($t1)
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
	lw $s5, 0($t1)
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
	lw $s5, 0($t1)
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
	#lw $s5, 0($t1)
	#lw $s6, 4($t1)
	#add $s6, $s6, $s5
	#lw $s5, 8($t1)
	#add $s6, $s6, $s5
	#lw $s5, 12($t1)
	#add $s6, $s6, $s5
	#lw $s5, 16($t1)
	#add $s6, $s6, $s5
	#lw $s5, 20($t1)
	#add $s6, $s6, $s5
	#lw $s5, 24($t1)
	#add $s6, $s6, $s5
	#lw $s5, 28($t1)
	#add $s6, $s6, $s5
	#lw $s5, 32($t1)
	#add $s6, $s6, $s5
	#beq $s6, 32, END 

	j COMECO #se ninguem ganhou

#################################IA DO PC#######################
JOGADA_COMPUTADOR:
	li $s5, 0 #carrega s5 = 0
	li $s6, 0 #carrega s6 = 0
	li $s7, 0 #carrega s7 = 0
	la $t1, matrix
	#VERIFICA_SE_PODE_GANHAR##############
	#Checa as linhas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_PRIMEIRA_DIAGONAL
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_SEGUNDA_DIAGONAL
	#Linha 1
	lw $s5, 0($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_PRIMEIRA_LINHA
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_SEGUNDA_LINHA
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_TERCEIRA_LINHA
	#Coluna 1
	lw $s5, 0($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_PRIMEIRA_COLUNA
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_SEGUNDA_COLUNA
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 10, O_TERCEIRA_COLUNA

	#VERIFICA_SE_O_PLAYER_PODE_GANHAR###########3
	#Checa as linhas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_PRIMEIRA_DIAGONAL
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_DIAGONAL
	#Linha 1
	lw $s5, 0($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_PRIMEIRA_LINHA
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_LINHA
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_TERCEIRA_LINHA
	#Coluna 1
	lw $s5, 0($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_PRIMEIRA_COLUNA
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_COLUNA
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_TERCEIRA_COLUNA
	#Checa jogadas especificas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 11, LINHA21
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 11, LINHA21

	#VERIFICA_SE_O_PLAYER_PODE_GANHAR###########3
	#Checa as linhas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7,6,  O_PRIMEIRA_DIAGONAL
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_DIAGONAL
	#Linha 1
	lw $s5, 0($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_PRIMEIRA_LINHA
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_LINHA
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_TERCEIRA_LINHA
	#Coluna 1
	lw $s5, 0($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_PRIMEIRA_COLUNA
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_SEGUNDA_COLUNA
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 6, O_TERCEIRA_COLUNA
	#VERIFICA_SE_TEM_ALGUM_PROPRIO
	#Checa as linhas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_PRIMEIRA_DIAGONAL
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_SEGUNDA_DIAGONAL
	#Linha 1
	lw $s5, 0($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_PRIMEIRA_LINHA
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_SEGUNDA_LINHA
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_TERCEIRA_LINHA
	#Coluna 1
	lw $s5, 0($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_PRIMEIRA_COLUNA
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_SEGUNDA_COLUNA
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 5, O_TERCEIRA_COLUNA

	#VERIFICA_COMO_IMPEDIR_PLAYER_GANHAR
	#Checa as linhas
	#Diagonal 1
	lw $s5, 0($t1)
	lw $s6, 16($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_PRIMEIRA_DIAGONAL
	#Diagonal 2
	lw $s5, 8($t1)
	lw $s6, 16($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_SEGUNDA_DIAGONAL
	#Linha 1
	lw $s5, 0($t1)
	lw $s6, 4($t1)
	lw $s7, 8($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_PRIMEIRA_LINHA
	#Linha 2
	lw $s5, 12($t1)
	lw $s6, 16($t1)
	lw $s7, 20($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_SEGUNDA_LINHA
	#Linha 3
	lw $s5, 24($t1)
	lw $s6, 28($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_TERCEIRA_LINHA
	#Coluna 1
	lw $s5, 0($t1)
	lw $s6, 12($t1)
	lw $s7, 24($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_PRIMEIRA_COLUNA
	#Coluna 2
	lw $s5, 4($t1)
	lw $s6, 16($t1)
	lw $s7, 28($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_SEGUNDA_COLUNA
	#Coluna 3
	lw $s5, 8($t1)
	lw $s6, 20($t1)
	lw $s7, 32($t1)
	add $s6, $s6, $s5
	add $s7, $s7, $s6
	beq $s7, 3, O_TERCEIRA_COLUNA

	#COLOCA_NO_MEIO
	lw $s5, 16($t1)
	beqz $s5, LINHA22
	#COLOCA_NA_PRIMEIRA_POSICAO
	lw $s5, 0($t1)
	beqz $s5, LINHA11
	#COLOCA_NA_TERCEIRA_POSICAO
	lw $s5, 8($t1)
	beqz $s5, LINHA13
	#COLOCA_NA_SETIMA_POSICAO
	lw $s5, 24($t1)
	beqz $s5, LINHA31
	#COLOCA_NA_ULTIMA_POSICAO
	lw $s5, 32($t1)
	beqz $s5, LINHA33
	#COLOCA_NA_SEGUNDA_POSICAO
	lw $s5, 4($t1)
	beqz $s5, LINHA12
	#COLOCA_NA_QUARTA_POSICAO
	lw $s5, 12($t1)
	beqz $s5, LINHA21
	#COLOCA_NA_SEXTA_POSICAO
	lw $s5, 20($t1)
	beqz $s5, LINHA23
	#COLOCA_NA_OITAVA_POSICAO
	lw $s5, 28($t1)
	beqz $s5, LINHA32

O_PRIMEIRA_LINHA:
	lw $s5, 0($t1)
	beqz $s5, LINHA11
	lw $s5, 4($t1)
	beqz $s5, LINHA12
	lw $s5, 8($t1)
	beqz $s5, LINHA13

	LINHA11:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 0($t1) #salvar reg s3 no vetor t1
		li $s6, 1
		j CHECAR_VETOR_CHAR

	LINHA12:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 4($t1) #salvar reg s3 no vetor t1
		li $s6, 2
		j CHECAR_VETOR_CHAR

	LINHA13:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 8($t1) #salvar reg s3 no vetor t1
		li $s6, 3
		j CHECAR_VETOR_CHAR

O_SEGUNDA_LINHA:
	lw $s5, 12($t1)
	beqz $s5, LINHA21
	lw $s5, 16($t1)
	beqz $s5, LINHA22
	lw $s5, 20($t1)
	beqz $s5, LINHA23

	LINHA21:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 12($t1) #salvar reg s3 no vetor t1
		li $s6, 4
		j CHECAR_VETOR_CHAR

	LINHA22:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 16($t1) #salvar reg s3 no vetor t1
		li $s6, 5
		j CHECAR_VETOR_CHAR

	LINHA23:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 20($t1) #salvar reg s3 no vetor t1
		li $s6, 6
		j CHECAR_VETOR_CHAR

O_TERCEIRA_LINHA:
	lw $s5, 24($t1)
	beqz $s5, LINHA31
	lw $s5, 28($t1)
	beqz $s5, LINHA32
	lw $s5, 32($t1)
	beqz $s5, LINHA33

	LINHA31:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 24($t1) #salvar reg s3 no vetor t1
		li $s6, 7
		j CHECAR_VETOR_CHAR

	LINHA32:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 28($t1) #salvar reg s3 no vetor t1
		li $s6, 8
		j CHECAR_VETOR_CHAR

	LINHA33:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 32($t1) #salvar reg s3 no vetor t1
		li $s6, 9
		j CHECAR_VETOR_CHAR

O_PRIMEIRA_COLUNA:
	lw $s5, 0($t1)
	beqz $s5, COLUNA11
	lw $s5, 12($t1)
	beqz $s5, COLUNA12
	lw $s5, 24($t1)
	beqz $s5, COLUNA13

	COLUNA11:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 0($t1) #salvar reg s3 no vetor t1
		li $s6, 1
		j CHECAR_VETOR_CHAR

	COLUNA12:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 12($t1) #salvar reg s3 no vetor t1
		li $s6, 4
		j CHECAR_VETOR_CHAR

	COLUNA13:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 24($t1) #salvar reg s3 no vetor t1
		li $s6, 7
		j CHECAR_VETOR_CHAR

O_SEGUNDA_COLUNA:
	lw $s5, 4($t1)
	beqz $s5, COLUNA21
	lw $s5, 16($t1)
	beqz $s5, COLUNA22
	lw $s5, 28($t1)
	beqz $s5, COLUNA23

	COLUNA21:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 4($t1) #salvar reg s3 no vetor t1
		li $s6, 2
		j CHECAR_VETOR_CHAR

	COLUNA22:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 16($t1) #salvar reg s3 no vetor t1
		li $s6, 5
		j CHECAR_VETOR_CHAR

	COLUNA23:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 28($t1) #salvar reg s3 no vetor t1
		li $s6, 8
		j CHECAR_VETOR_CHAR

O_TERCEIRA_COLUNA:
	lw $s5, 8($t1)
	beqz $s5, COLUNA31
	lw $s5, 20($t1)
	beqz $s5, COLUNA32
	lw $s5, 32($t1)
	beqz $s5, COLUNA33

	COLUNA31:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 8($t1) #salvar reg s3 no vetor t1
		li $s6, 3
		j CHECAR_VETOR_CHAR

	COLUNA32:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 20($t1) #salvar reg s3 no vetor t1
		li $s6, 6
		j CHECAR_VETOR_CHAR

	COLUNA33:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 32($t1) #salvar reg s3 no vetor t1
		li $s6, 9
		j CHECAR_VETOR_CHAR

O_PRIMEIRA_DIAGONAL:
	lw $s5, 16($t1)
	beqz $s5, DIAGONAL12
	lw $s5, 0($t1)
	beqz $s5, DIAGONAL11
	lw $s5, 32($t1)
	beqz $s5, DIAGONAL13

	DIAGONAL11:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 0($t1) #salvar reg s3 no vetor t1
		li $s6, 1
		j CHECAR_VETOR_CHAR

	DIAGONAL12:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 16($t1) #salvar reg s3 no vetor t1
		li $s6, 5
		j CHECAR_VETOR_CHAR

	DIAGONAL13:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 32($t1) #salvar reg s3 no vetor t1
		li $s6, 9
		j CHECAR_VETOR_CHAR

O_SEGUNDA_DIAGONAL:
	lw $s5, 16($t1)
	beqz $s5, DIAGONAL22
	lw $s5, 8($t1)
	beqz $s5, DIAGONAL21
	lw $s5, 24($t1)
	beqz $s5, DIAGONAL23

	DIAGONAL21:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 8($t1) #salvar reg s3 no vetor t1
		li $s6, 3
		j CHECAR_VETOR_CHAR

	DIAGONAL22:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 16($t1) #salvar reg s3 no vetor t1
		li $s6, 5
		j CHECAR_VETOR_CHAR

	DIAGONAL23:
		addi $s5, $s5, O #adiciona no valor
		sw $s5, 24($t1) #salvar reg s3 no vetor t1
		li $s6, 7
		j CHECAR_VETOR_CHAR


##########FIM DE JOGO#############
O_GANHOU:
	la $t1, vet		#carrega o endereço
	li $t9, 0
	O_DESENHA:
		beq $t9, CONST, O_FIM 	# testa a condiçao
		lb $a0, ($t1) 			# carrega o char da memoria
		li $v0, PRINT_CHAR		# char deve estar em $a0
		syscall
		addi $t9, $t9, 1	# incremento do i  
		addi $t1,$t1, 1		# incrementa o endereço
		j O_DESENHA

	O_FIM:
		li $v0, 4   
		la $a0, OGanha
		syscall
		j NOVO_JOGO

X_GANHOU:
	la $t1, vet		#carrega o endereço
	li $t9, 0
	X_DESENHA:
		beq $t9, CONST, X_FIM 	# testa a condiçao
		lb $a0, ($t1) 			# carrega o char da memoria
		li $v0, PRINT_CHAR		# char deve estar em $a0
		syscall
		addi $t9, $t9, 1	# incremento do i  
		addi $t1,$t1, 1		# incrementa o endereço
		j X_DESENHA

	X_FIM:
		li $v0, 4   
		la $a0, XGanha
		syscall
		j NOVO_JOGO

EMPATE:
	la $t1, vet		#carrega o endereço
	li $t9, 0
	END_DESENHA:
		beq $t9, CONST, FIM 	# testa a condiçao
		lb $a0, ($t1) 			# carrega o char da memoria
		li $v0, PRINT_CHAR		# char deve estar em $a0
		syscall
		addi $t9, $t9, 1	# incremento do i  
		addi $t1,$t1, 1		# incrementa o endereço
		j END_DESENHA

	FIM:
		li $v0, 4   
		la $a0, empate
		syscall
		j NOVO_JOGO

NOVO_JOGO:
	li $v0, 4
	la $a0, novoJogo
	syscall
	li $v0, 4
	la $a0, aceita
	syscall
	li $v0, 4
	la $a0, naoAceita
	syscall
	li $v0, 5
	syscall
	move $t5, $v0
	beq $t5, 0, INICIO
	beq $t5, 1, END
	li $v0, 4
	la $a0, digitaCerto
	syscall
	j NOVO_JOGO

	END:
	li $v0, 10 		# terminate program
	syscall


##DEBUGER
#li $v0, 4   
#la $a0, debug
#syscall
