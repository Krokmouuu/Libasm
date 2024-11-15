global ft_strlen

ft_strlen:
    ;


ft_strlen:
    xor rax, rax          ; longueur initiale = 0
.loop:
    cmp byte [rdi + rax], 0 ; comparer caractère actuel avec '\0'
    je .done               ; si '\0', fin de chaîne
    inc rax                ; incrémenter la longueur
    jmp .loop              ; répéter
.done:
    ret
