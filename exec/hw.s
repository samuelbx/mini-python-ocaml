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
	jle L109
	cmpq $1, %r10
	jle L113
	cmpq $2, %r10
	jle L115
	cmpq $3, %r10
	jle L131
	cmpq $4, %r10
	jle L147
L105:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L147:
	movq $0, -104(%rbp)
L146:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -112(%rbp)
	movq $2, %r8
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L141
L107:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L105
L141:
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
	jmp L146
L131:
	movq $0, -88(%rbp)
L130:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jz L107
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
	jmp L130
L115:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L107
L113:
	cmpq $0, %rsi
	jle L111
	movq $.LC2, %rdi
L110:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L107
L111:
	movq $.LC3, %rdi
	jmp L110
L109:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L107
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
	jle L44
	cmpq $1, %r10
	jle L44
	cmpq $2, %r10
	jle L51
	cmpq $3, %r10
	jle L88
	cmpq $4, %r10
	jle L88
L44:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L88:
	movq -40(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L83:
	cmpq %r8, -32(%rbp)
	jle L82
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L65:
	cmpq %r8, -40(%rbp)
	jl L44
L64:
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
	jmp L65
L82:
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
	jmp L83
	jmp L88
L51:
	addq %r8, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -24(%rbp)
	jmp L44
	jmp L44
	jmp L44
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
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
