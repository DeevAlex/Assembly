.data
	# area para dados na memoria principal
	msg: .asciiz "Ol�, Mundo" # mensagem a ser exibida

.text
	# area para instru��es do programa

	li $v0, 4 # instru��o para impress�o de strings
	la $a0, msg # indica  o endere�o em que est� a mensagem 
	syscall # fa�a! imprima