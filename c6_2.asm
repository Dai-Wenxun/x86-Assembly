
jmp near start

number db 0, 0, 0

start:
    xor ax, ax
    mov al, 0x1
    neg al
    cbw 

    sub ah, al

    cbw
    neg al
    add ah, al

    mov ah, 0xff
    cbw

    mov ax, 0x0400
    mov bl, 0xf0
    idiv bl

jmp near $



times 510-($-$$) db 0
db 0x55, 0xaa