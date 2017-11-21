# %edi - index of item being inspected
# %ebx - largest integer found
# %eax - current data item
#
# data_items - null-terminated item data
#

.section .data

data_items:
	.long 3, 67, 332, 54, 75, 2, 11, 66, 62, 82, 22, 0

.section .text

.globl _start
_start:
	movl	$0, %edi
	movl	data_items(,%edi,4), %eax
	movl	%eax, %ebx

start_loop:
	cmpl	$0, %eax
	je	loop_exit

	incl	%edi
	movl	data_items(,%edi,4), %eax
	cmpl	%ebx, %eax
	jle	start_loop
	
	movl	%eax, %ebx
	jmp	start_loop

loop_exit:
	movl	$1, %eax
	int	$0x80
