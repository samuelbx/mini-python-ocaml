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
	jle L86
	cmpq $1, %r10
	jle L90
	cmpq $2, %r10
	jle L92
	cmpq $3, %r10
	jle L108
	cmpq $4, %r10
	jle L124
L82:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L124:
	movq $0, -112(%rbp)
L123:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L118
L84:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L82
L118:
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
	jmp L123
L108:
	movq $0, -96(%rbp)
L107:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L84
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
	jmp L107
L92:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L84
L90:
	cmpq $0, %rsi
	jle L88
	movq $.LC2, %rdi
L87:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L84
L88:
	movq $.LC3, %rdi
	jmp L87
L86:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L84
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
	jle L21
	cmpq $1, %r10
	jle L21
	cmpq $2, %r10
	jle L28
	cmpq $3, %r10
	jle L65
	cmpq $4, %r10
	jle L65
L21:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L65:
	movq -48(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L60:
	cmpq %r8, -40(%rbp)
	jle L59
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L42:
	cmpq %r8, -48(%rbp)
	jl L21
L41:
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
	jmp L42
L59:
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
	jmp L60
	jmp L65
L28:
	addq %r8, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -32(%rbp)
	jmp L21
	jmp L21
	jmp L21
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call __len__
	movq %rax, %rdi
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
