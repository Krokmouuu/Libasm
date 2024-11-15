section .text
global ft_strcpy             ;

ft_strcpy:
    xor rcx, rcx             ; index = 0 
    jmp cpy                  ; sauter à 'cpy' pour commencer

cpy:
    mov rdx, [rsi + rcx]     ; charger le byte de la chaîne source à l'adresse 'rsi + rcx' dans rdx
    mov [rdi + rcx], rdx     ; copier le byte chargé dans rdx à l'adresse 'rdi + rcx' (destination)
    cmp dl, 0                ; comparer le byte copié (dl) avec 0 pour vérifier si c'est le caractère nul '\0'
    je exit                  ; ci le byte est nul ('\0'), sauter à 'exit' pour terminer la fonction
    inc rcx                  ; incrémenter l'index (rcx++) pour passer au caractère suivant dans les chaînes
    jmp cpy                  ; revenir au début de la boucle pour copier le prochain caractère

exit:
    mov rax, rdi             ; charger l'adresse de la destination (rdi) dans rax (valeur de retour)
    ret                      ; retourner à l'appelant avec l'adresse de la destination dans rax
