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
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L76
	cmpq $1, %r10
	jle L80
	cmpq $2, %r10
	jle L82
	cmpq $3, %r10
	jle L98
	cmpq $4, %r10
	jle L124
L74:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L124:
	movq $0, -88(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L121:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	subq -88(%rbp), %r10
	testq %r10, %r10
	jnz L118
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L74
L118:
	movq -88(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	subq -88(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L105
L99:
	incq -88(%rbp)
	jmp L121
L105:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L99
L98:
	movq $0, -72(%rbp)
L97:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -80(%rbp)
	movq $2, %r8
	subq -72(%rbp), %r10
	testq %r10, %r10
	jz L74
	movq -72(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -72(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -72(%rbp)
	jmp L97
L82:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L74
L80:
	cmpq $0, %rsi
	jle L78
	movq $.LC2, %rdi
L77:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L74
L78:
	movq $.LC3, %rdi
	jmp L77
L76:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L74
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -40(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -24(%rbp)
	movq -8(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -32(%rbp)
	cmpq $0, %r10
	jle L13
	cmpq $1, %r10
	jle L13
	cmpq $2, %r10
	jle L20
	cmpq $3, %r10
	jle L57
	cmpq $4, %r10
	jle L57
L13:
	movq -16(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L57:
	movq -32(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -32(%rbp)
	movq -32(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L52:
	cmpq %r8, -24(%rbp)
	jle L51
	addq -24(%rbp), %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L34:
	cmpq %r8, -32(%rbp)
	jl L13
L33:
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
	jmp L34
L51:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -104(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L52
	jmp L57
L20:
	movq -24(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -24(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -16(%rbp)
	jmp L13
	jmp L13
	jmp L13
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $42, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -64(%rbp), %r15
	movq %r15, 8(%rdi)
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
