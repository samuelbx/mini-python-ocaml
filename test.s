	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	movq $48, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -8(%rbp), %r11
	movq %r8, 8(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 16(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 24(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 32(%r11)
	movq -8(%rbp), %r10
	movq $24, %rdi
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
