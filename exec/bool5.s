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
	jle L98
	cmpq $1, %r10
	jle L102
	cmpq $2, %r10
	jle L104
	cmpq $3, %r10
	jle L120
	cmpq $4, %r10
	jle L146
L96:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L146:
	movq $0, -88(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L143:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	subq -88(%rbp), %r10
	testq %r10, %r10
	jnz L140
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L96
L140:
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
	jnz L127
L121:
	incq -88(%rbp)
	jmp L143
L127:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L121
L120:
	movq $0, -72(%rbp)
L119:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -80(%rbp)
	movq $2, %r8
	subq -72(%rbp), %r10
	testq %r10, %r10
	jz L96
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
	jmp L119
L104:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L96
L102:
	cmpq $0, %rsi
	jle L100
	movq $.LC2, %rdi
L99:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L96
L100:
	movq $.LC3, %rdi
	jmp L99
L98:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L96
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
	jle L35
	cmpq $1, %r10
	jle L35
	cmpq $2, %r10
	jle L42
	cmpq $3, %r10
	jle L79
	cmpq $4, %r10
	jle L79
L35:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L79:
	movq -40(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L74:
	cmpq %r8, -32(%rbp)
	jle L73
	addq -32(%rbp), %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L56:
	cmpq %r8, -40(%rbp)
	jl L35
L55:
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
	jmp L56
L73:
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
	jmp L74
	jmp L79
L42:
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
	jmp L35
	jmp L35
	jmp L35
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
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
