.data
	# area para dados na memoria principal
	msg: .asciiz "Olá, Mundo" # mensagem a ser exibida

.text
	# area para instruções do programa

	li $v0, 4 # instrução para impressão de strings
	la $a0, msg # indica  o endereço em que está a mensagem 
	syscall # faça! imprima