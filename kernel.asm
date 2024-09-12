BITS 32

global _start
extern main

_start:
    ; Initialiser le segment de données
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x9c00

    ; Appeler la fonction main en C
    call main

    ; Boucle infinie
    jmp $
