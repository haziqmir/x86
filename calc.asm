global _start

section .rodata
	hello_world: db "Hello world!", 0xA, 0x0

section .text
_start:
	enter	0,0
	push	hello_world
	call	_print_msg

	mov	eax, 0x01
	mov	ebx, 0
	int	0x80

_print_msg:
	enter	0, 0
	mov	eax, 0x04
	mov	ebx, 0x1
	mov	ecx, [ebp+8]
	push	eax
	push	ecx
	push	dword [ebp+8]
	call	_strlen
	mov	edx, eax
	add	esp, 4
	pop	ecx
	pop	eax
	int	0x80
	leave
	ret

_strlen:
	enter	0, 0
	mov	eax, 0
	mov	ecx, [ebp+8]
_strlen_loop_start:
	cmp	byte [ecx], 0
	je	_strlen_loop_end
	inc	eax
	add	ecx, 1
	jmp	_strlen_loop_start
_strlen_loop_end:
	leave
	ret
