CHROUT  = $ffd2     ; C64 KERNAL ROM, output a character to current device.

.code
.include "inc/bootstrap.s"

main:
    ldx #0          ; Starting index 0 in X register.
printnext:
    lda text,x      ; Get character from string.
    beq done        ; If we read a 0 we're done.
    jsr CHROUT      ; Output character. 
    inx             ; Increment index to next character.
    bne printnext   ; Repeat if index doesn't overflow to 0.
done:
    rts             ; Return from subroutine.
 
.rodata
text:
    .asciiz "hello world!"

; vim: set ft=asm_ca65 :
