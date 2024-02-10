.data

	caractere: .byte 'a' # caractere a ser imprimido

.text 

	li $v0, 4
	la $a0, caractere
	syscall 
	
	# encerrar na "unha"
	li $v0, 10
	syscall 