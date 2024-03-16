	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	movq %r8, 0(%r10)
	movq %r8, 8(%r10)
	movq 0(%r10), %rsi
	movq 8(%r10), %r9
	movq $0, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L14
	movq $1, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L20
	movq $2, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L22
	movq $3, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L32
	movq $4, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L41
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
L41:
	movq $0, -32(%rbp)
	movq $1, -40(%rbp)
	cmpq -32(%rbp), %rsi
	jl L38
L11:
	movq -8(%rbp), %rdi
	call putchar
	movq %rax, %r10
	jmp L10
L38:
	movq $8, %r8
	movq -32(%rbp), %rdi
	imulq %r8, %rdi
	addq %r10, %rdi
	call __print__
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
L12:
	movq $10, -8(%rbp)
	jmp L11
L32:
	movq $0, -16(%rbp)
	movq $1, -24(%rbp)
	cmpq -16(%rbp), %rsi
	jle L11
L29:
	movq $8, %r9
	movq -16(%rbp), %r8
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call putchar
	movq %rax, %r10
	movq -16(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -16(%rbp)
	jmp L12
L22:
	movq $.LC1, %rdi
	call printf
	movq %rax, %r10
	jmp L12
L20:
	movq $0, %r8
	subq %rsi, %r8
	testq %r8, %r8
	jz L17
	movq $.LC2, %rdi
L15:
	call printf
	movq %rax, %r10
	jmp L12
L17:
	movq $.LC3, %rdi
	jmp L15
L14:
	movq $.LC4, %rdi
	call printf
	movq %rax, %r10
	jmp L12
	.data
.LC4:
	.string "None"
.LC3:
	.string "True"
.LC1:
	.string "%d"
.LC2:
	.string "False"
