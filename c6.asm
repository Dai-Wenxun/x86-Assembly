
jmp near start

text db 'z', 0x07, 's', 0x07, 'y', 0x07
number db 0, 0, 0


start:
    mov ax, 0xb800
    mov es, ax
    mov di, 0

    mov ax, 0x7c0
    mov ds, ax
    mov si, text

    mov cx, number-text

    cld

    rep movsb 

    mov ax, 521
    mov dh, 10
    mov cx, 3
    mov bx, number
logit:
    div dh
    mov [bx], ah
    inc bx
    xor ah, ah
    loop logit

    mov bx, number
    mov si, 2
show:
    mov al, [bx+si]
    add al, 0x30
    mov ah, 0x04
    mov [es:di], ax
    add di, 2
    dec si

    jns show

times 510-($-$$) db 0
db 0x55, 0xAA