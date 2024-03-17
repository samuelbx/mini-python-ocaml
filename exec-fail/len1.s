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
	jle L75
	cmpq $1, %r10
	jle L79
	cmpq $2, %r10
	jle L81
	cmpq $3, %r10
	jle L97
	cmpq $4, %r10
	jle L123
L73:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L123:
	movq $0, -80(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L120:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	subq -80(%rbp), %r10
	testq %r10, %r10
	jnz L117
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L73
L117:
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
	jnz L104
L98:
	incq -80(%rbp)
	jmp L120
L104:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L98
L97:
	movq $0, -64(%rbp)
L96:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jz L73
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
	jmp L96
L81:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
L79:
	cmpq $0, %rsi
	jle L77
	movq $.LC2, %rdi
L76:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
L77:
	movq $.LC3, %rdi
	jmp L76
L75:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
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
	jle L12
	cmpq $1, %r10
	jle L12
	cmpq $2, %r10
	jle L19
	cmpq $3, %r10
	jle L56
	cmpq $4, %r10
	jle L56
L12:
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L56:
	movq -24(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -24(%rbp)
	movq -24(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L51:
	cmpq %r8, -16(%rbp)
	jle L50
	addq -16(%rbp), %r10
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L33:
	cmpq %r8, -24(%rbp)
	jl L12
L32:
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
	jmp L33
L50:
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
	jmp L51
	jmp L56
L19:
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
	jmp L12
	jmp L12
	jmp L12
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $1, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -40(%rbp), %r15
	movq %r15, 8(%rdi)
	call __len__
	movq %rax, %rdi
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
