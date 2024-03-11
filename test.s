	.text
	.globl	main
__main__:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rsi
	movq $.LC1, %rdi
	call printf
	movq $.LC2, %rdi
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
.LC2:
	.string "Hello World!"
.LC1:
	.string "%d"
