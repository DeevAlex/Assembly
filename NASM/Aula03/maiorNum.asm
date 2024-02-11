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

section .data 
    ; db -> define byte
    ; dw -> define word, corresponde a um char (um char tem 2 bytes)
    ; dd -> seria como um correspondente a um inteiro (ele tem 4 bytes) (short)
    ; dq -> define quad word corresponde a 8 bytes (na verdade ele tem 4 por causa de conversões de comparação)
    ; dt -> define teen word corresponde a 10 bytes
    x dd -50 ; dd -< define double word, capacidade -999999999 a 999999999
    y dd 10
    msg1 db 'x maior que y', LF, NULL
    tam1 equ $- msg1
    msg2 db 'y maior que x', LF, NULL
    tam2 equ $- msg2

section .text


global _start


_start:
    mov EAX, DWORD[x] ; MOVENDO X PARA DENTRO DO REGISTRADOR EAX, quando estamos fazendo uma movimentação da seção data para os registradores usa-se a palavra DWORD
    mov EBX, DWORD[y] ; MOVENDO Y PARA DENTRO DO REGISTRADOR EBX

    ; IF - COMPARAÇÃO
    cmp EAX, EBX ; aqui estamos fazendo uma comparação um com o outro não a partir de um valor a parte, seria como um registrador um olhando para o outro sem comparação de menor ou maior também
    
    ; salto condicional
    ; je -> igual
    ; jg -> maior
    ; jge -> maior ou igual
    ; jl -> menor 
    ; jle -> menor ou igual
    ; jne -> diferente

    jge maior ; SERIA ASSIM A REPRESENTAçÃO -> EAX >= EBX
    
    ; CASO CONTRARIO
    mov ECX, msg2
    mov EDX, tam2

    ; salto incondicional
    ; jmp -> go to

    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1


final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    xor EBX, EBX; mov EBX, RET_EXIT, A TABELA ABAIXO É SO PARA REPRESENTAR QUE (ov EBX, RET_EXIT e xor EBX, EBX) é o mesmo resultado
    int SYS_CALL


;       AND     OR      XOR     
; 7 -   0111    0111    0111    0111
; 5 -   0101    0101    0101    0111
;       0101    0111    0010    0000
;       5       7       2       0