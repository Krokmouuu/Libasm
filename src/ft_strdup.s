global ft_strdup ;

extern ft_strlen ;
extern ft_strcpy ;
extern __errno_location ;
extern malloc ;

ft_strdup:
	call		ft_strlen		; obtenir longueur
	inc			rax				; ajouter 1 pour '\0'
	mov			rbx, rdi		; sauvegarder pointeur source
	mov			rdi, rax		; taille pour malloc
	call		malloc			; allouer mémoire
	cmp			rax, 0
	je			.ret_error		; vérifier allocation réussie
	mov			rdi, rax		; destination
	mov			rsi, rbx		; source
	call		ft_strcpy
	ret

.ret_error:
	mov		rdi, rax			;  NULL
	neg		rdi					; -1
	call	__errno_location	; errno
	mov		[rax], rdi			; errno = -1
	mov		rax, -1				; Retourner NULL
	ret							; Retourner