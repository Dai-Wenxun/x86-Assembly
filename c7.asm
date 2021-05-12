jmp near start

message db '1+2+3+...+100='

start:

    mov ax, 0x7c0
    mov ds, ax
    mov si, message
    
    mov ax, 0xb800
    mov es, ax
    mov di, 0

    mov cx, start-message
    @s1:
        mov al, [si]
        mov ah, 0x07
        mov [es:di], ax
        inc si
        add di, 2

        loop @s1

    xor ax, ax
    mov dx, 1
    mov cx, 100

    @f:
        add ax, dx
        inc dx
        
        loop @f
    
    xor cx, cx
    mov ss, cx
    mov sp, cx

    mov bx, 10
    xor cx, cx

    @s2:

    
        jmp near $

times 510-($-$$) db 0
                 db 0x55, 0xaa

