	.text
	.globl	main
my_malloc:
	pushq   %rbp
	movq    %rsp, %rbp
	andq    $-16, %rsp  # 16-byte stack alignment
	call    malloc
	movq    %rbp, %rsp
	popq    %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	movq $48, %rdi
	call my_malloc
	movq %rax, -8(%rbp)
	movq $4, %r8
	movq $3, %r10
	movq %r8, 0(%r15)
	movq %r15, -8(%rbp)
	movq %r10, 8(%r15)
	movq %r15, -8(%rbp)
	movq $24, %rdi
	call my_malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq %r10, 16(%r15)
	movq %r15, -8(%rbp)
	movq $24, %rdi
	call my_malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq %r10, 24(%r15)
	movq %r15, -8(%rbp)
	movq $24, %rdi
	call my_malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq %r10, 32(%r15)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r10
	movq $24, %rdi
	call my_malloc
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
