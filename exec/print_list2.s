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
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
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
	jle L145
L95:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L145:
	movq $0, -112(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L142:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L139
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L95
L139:
	movq -112(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	subq -112(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L126
L120:
	incq -112(%rbp)
	jmp L142
L126:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L120
L119:
	movq $0, -96(%rbp)
L118:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L95
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
	movq %rsi, -40(%rbp)
	movq %rdi, -32(%rbp)
	movq -32(%rbp), %r15
	movq 0(%r15), %r10
	movq -32(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -56(%rbp)
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	cmpq $0, %r10
	jle L34
	cmpq $1, %r10
	jle L34
	cmpq $2, %r10
	jle L41
	cmpq $3, %r10
	jle L78
	cmpq $4, %r10
	jle L78
L34:
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L78:
	movq -64(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -64(%rbp)
	movq -64(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -32(%rbp)
	addq $2, %r10
L73:
	cmpq %r8, -56(%rbp)
	jle L72
	addq -56(%rbp), %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L55:
	cmpq %r8, -64(%rbp)
	jl L34
L54:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -40(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L55
L72:
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
	jmp L73
	jmp L78
L41:
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -48(%rbp)
	jmp L34
	jmp L34
	jmp L34
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -24(%rbp), %r11
	movq %r8, 16(%r11)
	movq $2, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -24(%rbp), %r11
	movq %r8, 24(%r11)
	movq $3, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 32(%r11)
	movq -24(%rbp), %rdi
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
