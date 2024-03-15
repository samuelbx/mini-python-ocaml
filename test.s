	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $32, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 8(%r10)
	movq $2, %r8
	movq %r8, 16(%r10)
	movq $3, %r8
	movq %r8, 24(%r10)
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
