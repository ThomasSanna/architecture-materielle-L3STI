section .bss
buffer resb 128  ; Réserver 128 octets pour le buffer, donc on pourra lire jusqu'à 128 caractères. pas plus sinon on aura un buffer overflow

section .data
msg db "Entrez une chaîne de caractères: ", 0

section .text
global _start

_start:
    ; Afficher le message
    mov rax, 1          ; Code de l'appel système pour 'write' (1). Retrouver les codes de l'appel système sur https://filippo.io/linux-syscall-table/
    mov rdi, 1          ; Descripteur de fichier pour stdout (1)
    mov rsi, msg        ; Adresse du message à afficher
    mov rdx, 35         ; Longueur du message
    syscall             ; Effectuer l'appel système 'write(1, msg, 35)'

    ; Lire l'entrée du clavier
    mov rax, 0          ; Code de l'appel système pour 'read' (0)
    mov rdi, 0          ; Descripteur de fichier pour stdin (0)
    mov rsi, buffer     ; Adresse du buffer où stocker l'entrée
    mov rdx, 128        ; Taille maximale de l'entrée
    syscall             ; Effectuer l'appel système 'read(0, buffer, 128)'

    ; Afficher l'entrée lue
    mov rax, 1          ; Code de l'appel système pour 'write' (1)
    mov rdi, 1          ; Descripteur de fichier pour stdout (1)
    mov rsi, buffer     ; Adresse du buffer contenant l'entrée car l'entrée est stockée dans le buffer
    mov rdx, 128        ; Taille maximale de l'entrée
    syscall             ; Effectuer l'appel système 'write(1, buffer, 128)'

    ; Terminer le programme
    mov rax, 60         ; Code de l'appel système pour 'exit' (60)
    xor rdi, rdi        ; Code de retour (0 signifie succès)
    syscall             ; Effectuer l'appel système 'exit(0)'