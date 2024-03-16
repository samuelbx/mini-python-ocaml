	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-64, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L39
	cmpq $1, %r10
	jle L43
	cmpq $2, %r10
	jle L45
	cmpq $3, %r10
	jle L61
	cmpq $4, %r10
	jle L77
L35:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L77:
	movq $0, -56(%rbp)
L76:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jnz L71
L37:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L35
L71:
	movq -56(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	jmp L76
L61:
	movq $0, -32(%rbp)
L60:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L37
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L60
L45:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L37
L43:
	cmpq $0, %rsi
	jle L41
	movq $.LC2, %rdi
L40:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L37
L41:
	movq $.LC3, %rdi
	jmp L40
L39:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L37
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-64, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -8(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-64, %rsp
	movq $32, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $2, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $111, %r10
	movq %r10, 16(%rdi)
	movq $107, %r10
	movq %r10, 24(%rdi)
	call __len__
	movq %rax, %rdi
	call __print__
	movq $0, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
