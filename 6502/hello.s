.segment "LOADADDR"
.word $c000

.segment "CODE"
.org $c000
.export __LOADADDR__ = *

a_cr	= $0d		; Carriage return.
bsout	= $ffd2		; C64 KERNEL ROM, output a character to current device.

main:
	ldx #0			; Starting index 0 in X register.
printnext:
	lda text,x		; Get character from string.
	beq done		; If we read a 0 we're done.
	jsr bsout		; Output character. 
	inx				; Increment index to next character.
	bne printnext	; Repeat if index doesn't overflow to 0.
done:
	rts				; Return from subroutine.
 
text:
	.byte	"hello world!", a_cr, 0
