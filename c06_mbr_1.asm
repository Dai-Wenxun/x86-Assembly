jmp near start

text db '5', 0x07, '2', 0x07, '1', 0x07, '2', 0x07
number db 0, 0, 0, 0

start:
mov ax, 0xb800
mov es, ax
mov di, 0


mov ax, 0x7c0
mov ds, ax
mov si, text

mov cx, 6

cld
rep movsb

    xor ax, ax
    mov dx, 1
    mov cx, 100
add_f:
    add ax, dx
    inc dx
    loop add_f

    mov bx, 10
    xor dx, dx
    mov cx, 4
    mov si, number
logit:
    div bx
    mov [si], dl
    add byte [si], 0x30
    inc si
    xor dx, dx
    loop logit

    mov bx, number
    mov si, 3
show:
    mov al, [bx+si]
    mov ah, 0x04
    mov [es:di], ax

    add di, 2
    dec si

    jns show

    jmp near $

times 510-($-$$) db 0
db 0x55, 0xaa