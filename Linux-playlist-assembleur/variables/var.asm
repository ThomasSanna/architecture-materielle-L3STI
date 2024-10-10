bits 64

section .data
message db "Hello, World!", 10  ; Declare une chaîne de caracteres avec un saut de ligne a la fin
number db 42                    ; Declare un octet (8 bits) avec la valeur 42
mot dw 1234                    ; Declare un mot (16 bits) avec la valeur 1234
dmot dd 12345678               ; Declare un double mot (32 bits) avec la valeur 12345678
qmot dq 1234567890123456789    ; Declare un quadruple mot (64 bits) avec la valeur 1234567890123456789

section .text
global _start
_start:
  ; Afficher le message
  mov rax, 1          ; Code de l'appel systeme pour 'write' (1)
  mov rdi, 1          ; Descripteur de fichier pour stdout (1)
  mov rsi, message    ; Adresse du message a afficher
  mov rdx, 14         ; Longueur du message (13 caracteres + 1 pour le saut de ligne)
  syscall             ; Effectue l'appel systeme 'write(1, message, 14)'

  ; Charger et afficher la valeur de 'number'
  movzx rax, byte [number]  ; Charger la valeur de 'number' dans rax avec extension zero
  ; Vous pouvez ajouter du code ici pour afficher la valeur de 'number' si necessaire

  ; Terminer le programme
  mov rax, 60         ; Code de l'appel systeme pour 'exit' (60)
  xor rdi, rdi        ; Code de retour (0 signifie succes)
  syscall             ; Effectue l'appel systeme 'exit(0)'