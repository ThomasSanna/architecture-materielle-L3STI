global main ; Déclare main comme un symbole global, ce qui signifie qu'il peut être référencé par le linker comme le point d'entrée du programme.
extern printf ; Déclare printf comme un symbole externe, ce qui signifie que le linker doit rechercher sa définition dans une autre unité de compilation.
section .text ; Définit la section de texte, qui contient le code exécutable du programme.
main: ; Définit le point d'entrée du programme.
    sub rsp, 28h ; Alloue de l'espace sur la pile pour l'appel de printf

    ; Affiche le message concaténé
    mov rcx, message ; Place l'adresse de 'message' dans rcx (premier argument pour printf)
    call printf ; Appelle la fonction printf

    add rsp, 28h ; Libère l'espace alloué sur la pile
    ret ; Retourne de la fonction

section .data
message:
    db 'Hello, World!', 10, 'Welcome to Assembly Programming!', 10, 'Goodbye!', 0 ; Déclare le message concaténé à afficher. 10 est le code ASCII pour un saut de ligne, et 0 est le caractère de fin de chaîne.

; nasm -f win64 helloworld.asm -o helloworld.obj
; gcc helloworld.obj -o helloworld.exe
; ./helloworld.exe