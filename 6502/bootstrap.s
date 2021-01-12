bootstrap:
    .word :+        ; pointer to next line of BASIC code
    .word $000a     ; line number
    .byte $20       ; space
    .byte $9e       ; SYS instruction

    ; convert address of main to ascii
    .byte <(((main / 1000) .mod 10) + $30)
    .byte <(((main / 100) .mod 10) + $30)
    .byte <(((main / 10) .mod 10) + $30)
    .byte <(((main / 1) .mod 10) + $30)

    .byte $00       ; end of line
    :
    .word $0000     ; end of program

; vim: set ft=asm_ca65 :
