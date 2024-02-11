segment .data ; segment -> parte de uma seção, usado para separar

    LF          equ 0xA ; LF -> LINE FEED
    NULL        equ 0xD ; sinaliza um final de String
    SYS_CALL    equ 0x80 ; envia informação ao S. O.

    ; VALORES MANDADOS PARA O EAX:
    
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; Operação de escrita
    SYS_EXIT    equ 0x1 ; Codigo de chamada para finalizar

    ; EBX: 

    RET_EXIT    equ 0x0 ; retornado para o SO, indica que a operação foi realizada com sucesso
    STD_IN      equ 0x0 ; ENTRADA PADRÃO
    STD_OUT     equ 0x1 ; VALOR DE SAIDA PADRÃO

section .data ; seção de constantes
    msg db "Digite seu nome:", LF, NULL
    tam equ $- msg

section .bss ; seção de variaveis
    nome resb 1 ; resb é para armazenar valores de byte em byte

section .text ; para dizer que estamos começando o programa

global _start ; para dizer que a seção global começa com _start

_start: ; label que sinaliza que o programa começa aqui
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg
    mov EDX, tam
    int SYS_CALL

    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, nome
    mov EDX, 0xA ; SINALIZA A QUANTIDADE DE CARACTERES QUE VAI PEGAR DO NOME, NO CASO AQUI É 10 caracteres
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL