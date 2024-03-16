	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L84
	cmpq $1, %r10
	jle L88
	cmpq $2, %r10
	jle L90
	cmpq $3, %r10
	jle L106
	cmpq $4, %r10
	jle L132
L82:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L132:
	movq $0, -104(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L129:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L126
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L82
L126:
	movq -104(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	subq -104(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L113
L107:
	incq -104(%rbp)
	jmp L129
L113:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L107
L106:
	movq $0, -88(%rbp)
L105:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jz L82
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
	jmp L105
L90:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
L88:
	cmpq $0, %rsi
	jle L86
	movq $.LC2, %rdi
L85:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
L86:
	movq $.LC3, %rdi
	jmp L85
L84:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
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
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -32(%rbp)
	jmp L21
	jmp L21
	jmp L21
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
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
