; A linguagem Assembly é na realidade uma versão legível da linguagem de máquina. Ela utiliza palavras abreviadas, chamadas mnemônicos, indicando a operação a ser realizada pelo processador. Exemplos de instruções Assembly: MOV R1, R2.

; É utilizada em geral para programação em baixo nível de máquina (mais próxima do nível do hardware), sendo que cada família de processadores (Ex. X86, ARM, SPARC, MIPS) possui sua própria linguagem assembly, já que cada processador possui seu próprio conjunto de instruções embutidas.

; compilar -> trasforma o programa para a linguagem de maquina
; nasm -f elf64 <nome do arquivo>.asm
; linkeditar -> trasformar o programa em linguagem de maquina para um executavel
; ld -s -o <nome para o executavel> <programa que será o executavel>.o
; para executar o executavel:
; no terminal digite o caminho onde foi criado, Ex: ./<nome do executavel>

section .data
    ; tudo que estiver aqui é apenas ponteiros
    ; 0xD é um caractere "null" que sinaliza que foi finalizado a impressão, é colocado apenas como um ponteiro
    msg db "Hello World!", 0xA, 0xD ;  o 0xA é a \n na tabela ASCII, quando for querer colocar apenas uma mensagem coloque o tamanho em baixo dela assim:
    tam equ $- msg ; pegando o valor do tamanho da string "Hello World!", equ -> igual

section .text

global _start

_start:

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tam
    int 0x80

saida:
    mov EAX, 0x1 ; SO estou terminando o programa
    mov EBX, 0x0 ; SO o valor de retorno é 0
    int 0x80 ; fim