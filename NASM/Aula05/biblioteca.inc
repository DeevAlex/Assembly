segment .data ; segment -> parte de uma seção, usado para separar

    LF          equ 0xA ; LF -> LINE FEED
    NULL        equ 0xD ; sinaliza um final de String
    SYS_CALL    equ 0x80 ; envia informação ao S. O.

    ; VALORES MANDADOS PARA O EAX:
    
    SYS_EXIT    equ 0x1 ; Codigo de chamada para finalizar
    SYS_READ    equ 0x3 ; operação de leitura
    SYS_WRITE   equ 0x4 ; Operação de escrita

    ; EBX: 

    RET_EXIT    equ 0x0 ; retornado para o SO, indica que a operação foi realizada com sucesso
    STD_IN      equ 0x0 ; ENTRADA PADRÃO
    STD_OUT     equ 0x1 ; VALOR DE SAIDA PADRÃO

segment .text


