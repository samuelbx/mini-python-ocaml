	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-72, %rsp
	movq %rdi, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L46
	cmpq $1, %r10
	jle L50
	cmpq $2, %r10
	jle L52
	cmpq $3, %r10
	jle L68
	cmpq $4, %r10
	jle L84
L42:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L84:
	movq $0, -64(%rbp)
L83:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L78
L44:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L42
L78:
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L83
L68:
	movq $0, -48(%rbp)
L67:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jz L44
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L67
L52:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L44
L50:
	cmpq $0, %rsi
	jle L48
	movq $.LC2, %rdi
L47:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L44
L48:
	movq $.LC3, %rdi
	jmp L47
L46:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L44
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-72, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -16(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-72, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L23
	movq $0, %rdi
L12:
	call __print__
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L23:
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call __len__
	movq %rax, %r10
	movq 8(%r10), %rdi
	cmpq $0, %rdi
	setne %dil
	jmp L12
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
