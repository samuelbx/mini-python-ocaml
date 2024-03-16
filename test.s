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
	movq 8(%r10), %rdi
	call def___print__
	movq %rax, %r10
	movq 8(%r10), %r10
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
def___print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq %rdi, %r10
	movq 0(%r10), %rsi
	movq 8(%r10), %r8
	movq $0, %r9
	subq %r8, %r9
	testq %r9, %r9
	jz L24
	movq $1, %r9
	subq %r8, %r9
	testq %r9, %r9
	jz L30
	movq $2, %r9
	subq %r8, %r9
	testq %r9, %r9
	jz L32
	movq $3, %r9
	subq %r8, %r9
	testq %r9, %r9
	jz L42
	movq $4, %r9
	subq %r8, %r9
	testq %r9, %r9
	jz L51
L19:
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L51:
	movq $0, -32(%rbp)
	movq $1, -40(%rbp)
	cmpq -32(%rbp), %rsi
	jl L48
L21:
	call putchar
	movq %rax, %r10
	jmp L19
L48:
	movq $8, %r8
	movq -32(%rbp), %rdi
	imulq %r8, %rdi
	addq %r10, %rdi
	call __print__
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
L22:
	movq $10, %rdi
	jmp L21
L42:
	movq $0, -16(%rbp)
	movq $1, -24(%rbp)
	cmpq -16(%rbp), %rsi
	jle L21
L39:
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
	jmp L22
L32:
	movq $.LC1, %rdi
	call printf
	movq %rax, %r10
	jmp L22
L30:
	movq $0, %r9
	subq %rsi, %r9
	testq %r9, %r9
	jz L27
	movq $.LC2, %rdi
L25:
	call printf
	movq %rax, %r10
	jmp L22
L27:
	movq $.LC3, %rdi
	jmp L25
L24:
	movq $.LC4, %rdi
	call printf
	movq %rax, %r10
	jmp L22
	.data
.LC4:
	.string "None"
.LC3:
	.string "True"
.LC1:
	.string "%d"
.LC2:
	.string "False"
