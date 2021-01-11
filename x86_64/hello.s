section .data
	hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string
        sys_write: equ 1
        sys_exit:  equ 60


section .text
	global _start

_start:
	mov rax,sys_write    ; The system call for write (sys_write)
	mov rdi,1            ; File descriptor 1 - standard output
	mov rsi,hello        ; Put the offset of hello in ecx
	mov rdx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	syscall              ; Call the kernel

	mov rax,sys_exit     ; The system call for exit (sys_exit)
	xor rdi,rdi          ; Exit with return code of 0 (no error)
	syscall
