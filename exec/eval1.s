	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L79
	cmpq $1, %r10
	jle L83
	cmpq $2, %r10
	jle L85
	cmpq $3, %r10
	jle L101
	cmpq $4, %r10
	jle L117
L75:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L117:
	movq $0, -112(%rbp)
L116:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L111
L77:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L75
L111:
	movq -112(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L116
L101:
	movq $0, -96(%rbp)
L100:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L77
	movq -96(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -96(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -96(%rbp)
	jmp L100
L85:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L77
L83:
	cmpq $0, %rsi
	jle L81
	movq $.LC2, %rdi
L80:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L77
L81:
	movq $.LC3, %rdi
	jmp L80
L79:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L77
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -72(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -32(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -32(%rbp), %r11
	movq %r10, 0(%r11)
	movq -32(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 32(%r11)
	movq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	movq $0, -8(%rbp)
L34:
	movq -24(%rbp), %r8
	movq -24(%rbp), %r10
	movq 8(%r10), %r9
	movq -8(%rbp), %r10
	addq $2, %r10
	cmpq %r9, -8(%rbp)
	jl L27
	movq $0, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L27:
	movq $8, %r9
	imulq %r9, %r10
	addq %r8, %r10
	movq 0(%r10), %r15
	movq %r15, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq %r10, -24(%rbp)
	movq -16(%rbp), %rdi
	call __print__
	incq -8(%rbp)
	jmp L34
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"