global ft_read

extern __errno_location

ft_read:
    mov rax, 0             ; syscall: read
    syscall                ; Effectuer l'appel système pour lire
    js .error              ; Si erreur (Négatif)
    ret                    ; Retourner si la lecture s'est bien passée

.error:
    call __errno_location  ; Appeler la fonction __errno_location pour obtenir l'adresse de errno
    mov [rax], rdi         ; Mettre errno à l'adresse pointée par rax (numero de l'appel systeme / 0 / 1 / 2)
    ret                    ; Retourner après gestion de l'erreur
