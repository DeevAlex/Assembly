%include 'biblioteca.inc'

section .text

global _start

_start:

    lea esi, [BUFFER]; LEA -> LOAD EFFECTIVE ADRESS (Ele associa um registrador lá do bss para um registrador aqui), depois daqui não podemos colocar mais nada no esi se não perderemos a conexão então utilize outro registrador
    add esi, 0x9
    mov byte[esi], 0xA

    dec esi
    mov dl, 0x11 ; 0x11 -> 'A', 0x31 -> 'a'
    add dl, '0' ; convertendo o 'A' para um caracter, se subtrairmos ele converte denovo o 'A',para um numero
    mov [esi], dl ; quando colocamos [] e um ponteiro quer dizer que estamos movendo dentro do ponteiro invés de mover diretamente

    ; Estamos decrementando por isso o resultado é 'BA' invés de 'AB', para isso coloque o seguinte codigo antes do 'A'
    dec esi
    mov dl, 0x12 ; 0x12 -> 'B', 0x32 -> 'b'
    add dl, '0' ; convertendo o 'A' para um caracter, se subtrairmos ele converte denovo o 'B',para um numero, nesse caso só converte em caso de 1 caractere
    mov [esi], dl ; quando colocamos [] e um ponteiro quer dizer que estamos movendo dentro do ponteiro invés de mover diretamente

    ; Aqui o resultado será 'CBA', para ir na ordem 0x13, 0x12, 0x11
    dec esi
    mov dl, 0x13 ; 0x13 -> 'C', 0x33 -> 'c'
    add dl, '0' ; convertendo o 'C' para um caracter, se subtrairmos ele converte denovo o 'C',para um numero
    mov [esi], dl ; quando colocamos [] e um ponteiro quer dizer que estamos movendo dentro do ponteiro invés de mover diretamente

    call saidaResultado ; estamos chamando a função da biblioteca, ele executa o codigo lá e quando acha o ret ele volta para cá

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL