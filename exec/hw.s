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
	jle L56
	cmpq $1, %r10
	jle L60
	cmpq $2, %r10
	jle L62
	cmpq $3, %r10
	jle L78
	cmpq $4, %r10
	jle L94
L52:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L94:
	movq $0, -56(%rbp)
L93:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jnz L88
L54:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L52
L88:
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
	jmp L93
L78:
	movq $0, -40(%rbp)
L77:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -48(%rbp)
	movq $2, %r8
	subq -40(%rbp), %r10
	testq %r10, %r10
	jz L54
	movq -40(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	jmp L77
L62:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L54
L60:
	cmpq $0, %rsi
	jle L58
	movq $.LC2, %rdi
L57:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L54
L58:
	movq $.LC3, %rdi
	jmp L57
L56:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L54
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
	movq $112, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $12, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $104, %r10
	movq %r10, 16(%rdi)
	movq $101, %r10
	movq %r10, 24(%rdi)
	movq $108, %r10
	movq %r10, 32(%rdi)
	movq $108, %r10
	movq %r10, 40(%rdi)
	movq $111, %r10
	movq %r10, 48(%rdi)
	movq $44, %r10
	movq %r10, 56(%rdi)
	movq $32, %r10
	movq %r10, 64(%rdi)
	movq $119, %r10
	movq %r10, 72(%rdi)
	movq $111, %r10
	movq %r10, 80(%rdi)
	movq $114, %r10
	movq %r10, 88(%rdi)
	movq $108, %r10
	movq %r10, 96(%rdi)
	movq $100, %r10
	movq %r10, 104(%rdi)
	call __print__
	movq $0, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
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
