global ft_write;


extern __errno_location

ft_write:
    mov rax, 1             ; syscall: write
    syscall
    js .error              ; si erreur (Négatif), gérer
    ret

.error:
    call __errno_location  ; obtenir l'adresse de errno
    mov [rax], rdi         ; placer errno dans la variable d'erreur
    ret
