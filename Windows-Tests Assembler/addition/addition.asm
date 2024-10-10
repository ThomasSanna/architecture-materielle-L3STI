global main 
extern printf
section .text 
main:
  sub rsp, 28h

  ; Load numbers into registers
  mov rax, 5      ; Premier nombre
  mov rbx, 10     ; Deuxième nombre

  ; Addition
  add rax, rbx    ; rax = rax + rbx

  ; Préparer le format de chaîne pour printf
  mov rcx, result_message
  mov rdx, rax    ; Le résultat de l'addition

  ; Appel à printf
  call printf

  add rsp, 28h
  ret

section .data
message:
  db 'Hello, World!', 10, 'Welcome to Assembly Programming!', 10, 'Goodbye!', 0

result_message:
  db 'The result of the addition is: %d', 10, 0

; nasm -f elf64 addition.asm -o addition.obj
; gcc addition.obj -o addition.exe
; ./addition.exe