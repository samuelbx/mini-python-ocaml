	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, -64(%rbp)
	movq -64(%rbp), %r15
	movq 0(%r15), %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L107
	cmpq $1, %r10
	jle L111
	cmpq $2, %r10
	jle L113
	cmpq $3, %r10
	jle L129
	cmpq $4, %r10
	jle L155
L105:
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L155:
	movq $0, -96(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L152:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	testq %r10, %r10
	jnz L149
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L105
L149:
	movq -96(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L136
L130:
	incq -96(%rbp)
	jmp L152
L136:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L130
L129:
	movq $0, -80(%rbp)
L128:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jz L105
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L128
L113:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L105
L111:
	cmpq $0, %rsi
	jle L109
	movq $.LC2, %rdi
L108:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L105
L109:
	movq $.LC3, %rdi
	jmp L108
L107:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L105
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -56(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
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
	jmp L44
	jmp L44
	jmp L44
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
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
	movq $0, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
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
