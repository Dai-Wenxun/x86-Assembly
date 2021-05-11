jmp near start

tst:
    mov al, 0x11
    jmp near $

start:
    mov al, 0x07
    cmp al, 0x08
    ; ; je tst ; ZF = 1
    ; ; jne tst ; ZF = 0
    
    jg tst ; ZF = 0 SF = OF
    ; ; jge tst ; SF = OF

times 510-($-$$) db 0
db 0x55, 0xaa