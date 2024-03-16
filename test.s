	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	movq %r8, 0(%r10)
	movq %r8, 8(%r10)
	movq 0(%r10), %r8
	movq 8(%r10), %r8
	movq $0, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L14
L10:
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
L14:
	movq $.LC1, %rdi
	call printf
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L10
	.data
.LC1:
	.string "None"
