%include 'biblioteca.inc'

section .data
    v1 dw '999', LF, NULL

section .text

global _start

_start:

    call converte_valor
    call mostrar_valor

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL

converte_valor:
    lea esi, [v1] ; pegando o valor da variavel v1 e jogando para dentro do esi ; no caso precisamos do esi e do ECX pois colocamos ali em baixo 
    mov ECX, 0x3 ; esse 0x3 é o tamanho da string
    call string_to_int ; a partir daqui temos 105 já em inteiro
    add EAX, 0x2 ; adicionado +2 em 105 = 107
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret

; ---------------------------------
; STRING para INTEIRO
; ----------------------------------
; ENTRADA DE INFORMAÇÂO VAI VIR PELO ESI (valor a converter) ECX (TAMANHO)
; SAIDA EM EAX
; ----------------------------------

string_to_int:
    xor EBX, EBX ; zerando o EBX
.prox_digito: 
    movzx EAX, byte[esi] ; movzx -> meio que faz uma associação de registradores (ELE NÃO MOVE UM CONTEUDO DE UM REGISTRADOR PARA OUTRO) ele move como se fosse UM elemento daquele registrador para outro (O QUE ACONTECER EM MEMORIA, ACONTECERÁ NO OUTRO)
    inc esi ; INCREMENTANDO O ESI
    sub al, '0' ; SUBTRAI
    imul EBX, 0xA ; MULTIPLICA
    add EBX, EAX ; ADICIONA -> até aqui está acontecendo isso -> EBX - EBX * 10 + EAX
    loop .prox_digito ; o loop seria correspondente a while (--ECX)
    mov EAX, EBX
    ret

; ----------------------------------
; INTEIRO para STRING
; ----------------------------------
; ENTRADA: INTEIRO EM EAX 
; SAIDA VAI SER JOGADA NO BUFFER (vai ter o valor ECX) e o tamanho do BUFFER vamos usar para EDX
; ----------------------------------

int_to_string:
    lea esi, [BUFFER] ; lea -> tudo que fizermos com o esi vai ser refletido lá no BUFFER
    add esi, 0x9 ; aqui agora o esi é uma string
    mov byte[esi], 0xA
    mov EBX, 0xA
.prox_digito:
    xor EDX, EDX
    div EBX ; DIV -> dividindo, EBX tinha 10 aqui estamos dividindo ele 
    add dl, '0'
    dec esi
    mov [esi], dl ; movendo o apontamento do esi para cima do dl
    test EAX, EAX ; testando EAX com EAX
    jnz .prox_digito ; se não é zero volta para o .prox_digito, ele não move para o proximo digito lá de cima porque o Assembly faz uma busca do mais proximo (normalmente não se coloca o nome de dois marcadores iguais) mas no caso atual não precisa
    ret