; helloworld.s for C= 8-bit machines, 64tass assembler format.
; String printing limited to strings of 256 characters or less.

* = $c000
 
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
	.text	"Hello world!", a_cr, 0
