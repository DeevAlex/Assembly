.data  # (não é preciso) armazena as variaveis que venham da memoria ram
	idade: .word 56 # valor inteiro na memoria ram

.text # obrigatorio

	li $v0, 1 # imprimindo
	lw $a0, idade # pegando a variavel na memoria ram 
	syscall 