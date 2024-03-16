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
	jle L99
	cmpq $1, %r10
	jle L103
	cmpq $2, %r10
	jle L105
	cmpq $3, %r10
	jle L121
	cmpq $4, %r10
	jle L137
L95:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L137:
	movq $0, -112(%rbp)
L136:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L131
L97:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L95
L131:
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
	jmp L136
L121:
	movq $0, -96(%rbp)
L120:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L97
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
	jmp L120
L105:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L97
L103:
	cmpq $0, %rsi
	jle L101
	movq $.LC2, %rdi
L100:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L97
L101:
	movq $.LC3, %rdi
	jmp L100
L99:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L97
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rsi, -24(%rbp)
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -40(%rbp)
	movq -24(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -48(%rbp)
	cmpq $0, %r10
	jle L34
	cmpq $1, %r10
	jle L34
	cmpq $2, %r10
	jle L41
	cmpq $3, %r10
	jle L78
	cmpq $4, %r10
	jle L78
L34:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L78:
	movq -48(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L73:
	cmpq %r8, -40(%rbp)
	jle L72
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L55:
	cmpq %r8, -48(%rbp)
	jl L34
L54:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -24(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L55
L72:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -16(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L73
	jmp L78
L41:
	addq %r8, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -32(%rbp)
	jmp L34
	jmp L34
	jmp L34
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
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
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
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
