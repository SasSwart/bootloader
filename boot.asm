	bits 16
	org 0x7c00
boot:
	mov si,hello
	mov ah,0x0e	; Write char in TTY mode
.loop:
	lodsb		; Load String byte from DS:SI
	or al,al	; Is al == 0?
	jz halt		; Halt if al == 0 (null terminated string)
	int 0x10	; BIOS interrupt for video services
	jmp .loop
halt:
	cli
	hlt

hello: db "Hi, Sas!",0

times 510 - ($-$$) db 0	; Pad rest of Bootloader memory
dw 0xaa55		; Make this bootable XD
