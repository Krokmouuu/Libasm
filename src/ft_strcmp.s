global ft_strcmp

section .text

ft_strcmp:
    mov rcx, -1                ; index = -1

while_loop:
    inc rcx                    ; index++
    mov r8b, byte [rdi + rcx]  ; charger le byte de la chaîne source à l'adresse rdi + rcx
    mov r9b, byte [rsi + rcx]  ; charger le byte de la chaîne comparée à l'adresse rsi + rcx
    cmp r8b, r9b               ; comparer les deux octets
    jne .return                ; si différents, on retourne la différence
    cmp r8b, 0                 ; vérifier si le byte de la source est '\0' (fin de chaîne)
    je .return                 ; si '\0', les chaînes sont égales
    cmp r9b, 0                 ; vérifier si le byte de la chaîne comparée est '\0' (fin de chaîne)
    je .return                 ; si '\0', les chaînes sont égales
    jmp while_loop             ; continuer la boucle

.return:
    sub r8b, r9b               ; soustraire r9b (char dans la chaîne comparée) de r8b (char dans la source)
    movsx rax, r8b             ; déplacer r8b signé (byte) dans rax
    ret                        ; retourner la différence
