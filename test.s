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
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L73
	cmpq $1, %r10
	jle L77
	cmpq $2, %r10
	jle L79
	cmpq $3, %r10
	jle L95
	cmpq $4, %r10
	jle L121
L71:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L121:
	movq $0, -80(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L118:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	subq -80(%rbp), %r10
	testq %r10, %r10
	jnz L115
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L71
L115:
	movq -80(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	subq -80(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L102
L96:
	incq -80(%rbp)
	jmp L118
L102:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L96
L95:
	movq $0, -64(%rbp)
L94:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jz L71
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L94
L79:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L71
L77:
	cmpq $0, %rsi
	jle L75
	movq $.LC2, %rdi
L74:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L71
L75:
	movq $.LC3, %rdi
	jmp L74
L73:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L71
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
	movq %rsi, -104(%rbp)
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -16(%rbp)
	movq -104(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -24(%rbp)
	cmpq $0, %r10
	jle L10
	cmpq $1, %r10
	jle L10
	cmpq $2, %r10
	jle L17
	cmpq $3, %r10
	jle L54
	cmpq $4, %r10
	jle L54
L10:
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L54:
	movq -24(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -24(%rbp)
	movq -24(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L49:
	cmpq %r8, -16(%rbp)
	jle L48
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L31:
	cmpq %r8, -24(%rbp)
	jl L10
L30:
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
	jmp L31
L48:
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
	jmp L49
	jmp L54
L17:
	movq -16(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -8(%rbp)
	jmp L10
	jmp L10
	jmp L10
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $0, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
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
