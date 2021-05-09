jmp near start

tst:
    mov al, 0x11
    jmp near $

start:
    mov al, 0x08
    cmp al, 0x07
    ; je tst
    jne tst



times 510-($-$$) db 0
db 0x55, 0xaa