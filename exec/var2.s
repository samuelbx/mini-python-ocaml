	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq %rdi, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L82
	cmpq $1, %r10
	jle L86
	cmpq $2, %r10
	jle L88
	cmpq $3, %r10
	jle L104
	cmpq $4, %r10
	jle L130
L80:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L130:
	movq $0, -88(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L127:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	subq -88(%rbp), %r10
	testq %r10, %r10
	jnz L124
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L80
L124:
	movq -88(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	subq -88(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L111
L105:
	incq -88(%rbp)
	jmp L127
L111:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L105
L104:
	movq $0, -72(%rbp)
L103:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -80(%rbp)
	movq $2, %r8
	subq -72(%rbp), %r10
	testq %r10, %r10
	jz L80
	movq -72(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -72(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -72(%rbp)
	jmp L103
L88:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L80
L86:
	cmpq $0, %rsi
	jle L84
	movq $.LC2, %rdi
L83:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L80
L84:
	movq $.LC3, %rdi
	jmp L83
L82:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L80
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -48(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
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
	jle L19
	cmpq $1, %r10
	jle L19
	cmpq $2, %r10
	jle L26
	cmpq $3, %r10
	jle L63
	cmpq $4, %r10
	jle L63
L19:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L63:
	movq -40(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L58:
	cmpq %r8, -32(%rbp)
	jle L57
	addq -32(%rbp), %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L40:
	cmpq %r8, -40(%rbp)
	jl L19
L39:
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
	jmp L40
L57:
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
	jmp L58
	jmp L63
L26:
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -24(%rbp)
	jmp L19
	jmp L19
	jmp L19
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $3, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $102, %r10
	movq %r10, 16(%rdi)
	movq $111, %r10
	movq %r10, 24(%rdi)
	movq $111, %r10
	movq %r10, 32(%rdi)
	call __print__
	movq %rax, %r10
	movq $0, %rax
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
