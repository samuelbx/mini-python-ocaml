	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L95
	cmpq $1, %r10
	jle L99
	cmpq $2, %r10
	jle L101
	cmpq $3, %r10
	jle L117
	cmpq $4, %r10
	jle L143
L93:
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L143:
	movq $0, -120(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L140:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -120(%rbp), %r10
	testq %r10, %r10
	jnz L137
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L93
L137:
	movq -120(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -120(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L124
L118:
	incq -120(%rbp)
	jmp L140
L124:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L118
L117:
	movq $0, -104(%rbp)
L116:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -112(%rbp)
	movq $2, %r8
	subq -104(%rbp), %r10
	testq %r10, %r10
	jz L93
	movq -104(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -104(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -104(%rbp)
	jmp L116
L101:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L93
L99:
	cmpq $0, %rsi
	jle L97
	movq $.LC2, %rdi
L96:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L93
L97:
	movq $.LC3, %rdi
	jmp L96
L95:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L93
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
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
	addq $-128, %rsp
	movq %rsi, -32(%rbp)
	movq %rdi, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -48(%rbp)
	movq -32(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -56(%rbp)
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
	movq -40(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L76:
	movq -56(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -56(%rbp)
	movq -56(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L71:
	cmpq %r8, -48(%rbp)
	jle L70
	addq -48(%rbp), %r10
	movq $0, %r8
	addq $2, -32(%rbp)
	addq $2, %r10
L53:
	cmpq %r8, -56(%rbp)
	jl L32
L52:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -32(%rbp), %r9
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
	addq -24(%rbp), %r9
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
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -40(%rbp)
	jmp L32
	jmp L32
	jmp L32
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq $0, -64(%rbp)
L30:
	movq $42, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -80(%rbp)
	movq $42, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r9
	movq -80(%rbp), %r10
	movq -64(%rbp), %r8
	addq $2, %r8
	cmpq %r9, -64(%rbp)
	jl L11
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L11:
	movq $8, %r10
	imulq %r10, %r8
	addq -80(%rbp), %r8
	movq %r8, %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	incq -64(%rbp)
	jmp L30
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
