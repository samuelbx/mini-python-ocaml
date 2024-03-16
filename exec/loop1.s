	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-72, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call def_loop
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
def_loop:
	pushq %rbp
	movq %rsp, %rbp
	addq $-72, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L55
	cmpq $1, %r10
	jle L59
	cmpq $2, %r10
	jle L61
	cmpq $3, %r10
	jle L77
L51:
	movq -16(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -32(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -32(%rbp)
	movq -32(%rbp), %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L36
L21:
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L36:
	movq -16(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r10
	addq %r10, -24(%rbp)
	movq -24(%rbp), %rdi
	call def_loop
	movq %rax, %r10
	movq 8(%r10), %r10
	jmp L21
L77:
	movq $0, -48(%rbp)
L76:
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L71
L53:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L51
L71:
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -40(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L76
L61:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L53
L59:
	cmpq $0, %rsi
	jle L57
	movq $.LC2, %rdi
L56:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L53
L57:
	movq $.LC3, %rdi
	jmp L56
L55:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L53
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
