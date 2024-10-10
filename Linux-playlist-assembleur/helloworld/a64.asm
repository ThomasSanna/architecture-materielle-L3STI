bits 64 ; Indique que le code est en mode 64 bits (pas obligatoire, mais recommandé pour les nouveaux programmes)

section .data ; Section de données, utilisée pour déclarer des données initialisées
  message db "Hello, World!", 10 ; Déclare une chaîne de caractères avec un saut de ligne à la fin

section .text ; Section de texte, utilisée pour le code exécutable
  global _start ; Déclare _start comme un symbole global, ce qui signifie qu'il peut être référencé par le linker comme le point d'entrée du programme.
  _start: ; "Label" qui définit le point d'entrée du programme.
  ; Appel système pour écrire un message sur la sortie standard (stdout)
  mov rax, 1 ; Code de l'appel système pour 'write' (1)
  mov rdi, 1 ; Descripteur de fichier pour stdout (1). stdout est le descripteur de fichier standard pour la sortie.
  mov rsi, message ; Adresse du message à afficher
  mov rdx, 13+1 ; Longueur du message (13 caractères) + 1 pour le saut de ligne
  syscall ; Effectue l'appel système 'write(1, message, 14)'

  ; Appel système pour terminer le programme
  mov rax, 60 ; Code de l'appel système pour 'exit' (60)
  mov rdi, 0 ; Code de retour (0 signifie succès)
  syscall ; Effectue l'appel système 'exit(0)'

; Commandes pour assembler et lier le programme :
; nasm -f elf64 a64.asm -o a64.o ; Assemble le fichier source en un fichier objet
; ld a64.o -o a64 ; Lie le fichier objet pour créer un exécutable