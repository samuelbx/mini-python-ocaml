	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L97
	cmpq $1, %r10
	jle L101
	cmpq $2, %r10
	jle L103
	cmpq $3, %r10
	jle L119
	cmpq $4, %r10
	jle L135
L93:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L135:
	movq $0, -104(%rbp)
L134:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -112(%rbp)
	movq $2, %r8
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L129
L95:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L93
L129:
	movq -104(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -104(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -104(%rbp)
	jmp L134
L119:
	movq $0, -88(%rbp)
L118:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jz L95
	movq -88(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -88(%rbp), %r15
	addq -96(%rbp), %r15
	movq %r15, -88(%rbp)
	jmp L118
L103:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L95
L101:
	cmpq $0, %rsi
	jle L99
	movq $.LC2, %rdi
L98:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L95
L99:
	movq $.LC3, %rdi
	jmp L98
L97:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L95
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -64(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rsi, -16(%rbp)
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -32(%rbp)
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -40(%rbp)
	cmpq $0, %r10
	jle L32
	cmpq $1, %r10
	jle L32
	cmpq $2, %r10
	jle L39
	cmpq $3, %r10
	jle L76
	cmpq $4, %r10
	jle L76
L32:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L76:
	movq -40(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L71:
	cmpq %r8, -32(%rbp)
	jle L70
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L53:
	cmpq %r8, -40(%rbp)
	jl L32
L52:
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
	jmp L53
L70:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -8(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L71
	jmp L76
L39:
	addq %r8, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -24(%rbp)
	jmp L32
	jmp L32
	jmp L32
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq $64, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $6, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $102, %r10
	movq %r10, 16(%rdi)
	movq $111, %r10
	movq %r10, 24(%rdi)
	movq $111, %r10
	movq %r10, 32(%rdi)
	movq $98, %r10
	movq %r10, 40(%rdi)
	movq $97, %r10
	movq %r10, 48(%rdi)
	movq $114, %r10
	movq %r10, 56(%rdi)
	call __print__
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
