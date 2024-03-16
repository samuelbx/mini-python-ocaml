	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	movq $24, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r8
	movq $1, %r10
	movq %r8, 0(%r15)
	movq %r15, -8(%rbp)
	movq %r10, 8(%r15)
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	movq %r8, 0(%r10)
	movq %r8, 8(%r10)
	movq %r10, 16(%r15)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r10
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
