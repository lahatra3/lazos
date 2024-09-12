BITS 16
ORG 0x7c00

start:
    ; Initialiser le segment de données
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; Charger le noyau en mémoire
    mov ah, 0x02        ; Fonction de lecture du disque
    mov al, 1           ; Nombre de secteur à lire
    mov ch, 0           ; Piste
    mov cl, 2           ; Secteur
    mov dh, 0           ; Tête
    mov dl, 0x80        ; Disque (0x80 pour le premier disque dur)
    mov bx, 0x0600      ; Adresse de destination en mémoire
    int 0x13            ; Appel à l'interruption BIOS

    ; Sauter au noyau
    jmp 0x0000:0x0600

times 510-($-$$) db 0
dw 0xaa55
