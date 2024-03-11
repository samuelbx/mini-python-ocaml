	.text
	.globl	main
__main__:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %r10
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
