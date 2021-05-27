SECTION header align=16
    jmp section.code.start

SECTION data align=16
    jump_dst dw 0x7c00

SECTION code align=16

xor ax, ax
mov ss, ax
mov sp, ax

mov ds, ax

mov ax, 0xb800
mov es, ax
mov di, 0

; 立即寻址
; mov ax, 0x38

; 直接寻址
; mov word [0x0000], 0x0038
; mov ax, [0x0000]

; 寄存器寻址
; inc ax

; 相对寻址

; 相对短转移
; jmp tail 

; 16位间接绝对近转移
;(1)
; mov ax, 0x7c02 
; jmp ax
;(2)

jmp [jump_dst]



mov bl, 10

tails:

call show

jmp tail

; 参数 
show: 
    div bl
    
    add al, 0x30
    mov [es:di], al
    mov byte [es:di+1], 0x07

    add di, 2

    add ah, 0x30
    mov [es:di], ah
    mov byte [es:di+1], 0x07

    ret

tail:
mov ax, $

times 510-($-$$) db 0
    db 0x55, 0xaa

