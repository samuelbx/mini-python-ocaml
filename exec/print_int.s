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
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L74
	cmpq $1, %r10
	jle L78
	cmpq $2, %r10
	jle L80
	cmpq $3, %r10
	jle L96
	cmpq $4, %r10
	jle L122
L72:
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L122:
	movq $0, -72(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L119:
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	subq -72(%rbp), %r10
	testq %r10, %r10
	jnz L116
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L72
L116:
	movq -72(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -40(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	subq -72(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L103
L97:
	incq -72(%rbp)
	jmp L119
L103:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L97
L96:
	movq $0, -56(%rbp)
L95:
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jz L72
	movq -56(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -40(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	jmp L95
L80:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L72
L78:
	cmpq $0, %rsi
	jle L76
	movq $.LC2, %rdi
L75:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L72
L76:
	movq $.LC3, %rdi
	jmp L75
L74:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L72
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -32(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rsi, -96(%rbp)
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -8(%rbp)
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -16(%rbp)
	cmpq $0, %r10
	jle L11
	cmpq $1, %r10
	jle L11
	cmpq $2, %r10
	jle L18
	cmpq $3, %r10
	jle L55
	cmpq $4, %r10
	jle L55
L11:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L55:
	movq -16(%rbp), %r15
	addq -8(%rbp), %r15
	movq %r15, -16(%rbp)
	movq -16(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -80(%rbp)
	addq $2, %r10
L50:
	cmpq %r8, -8(%rbp)
	jle L49
	addq -8(%rbp), %r10
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L32:
	cmpq %r8, -16(%rbp)
	jl L11
L31:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -96(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L32
L49:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -80(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L50
	jmp L55
L18:
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -104(%rbp)
	jmp L11
	jmp L11
	jmp L11
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $42, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -24(%rbp), %r15
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
