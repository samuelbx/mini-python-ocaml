	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
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
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L146:
	movq $0, -112(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L143:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L140
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L96
L140:
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
	jnz L127
L121:
	incq -112(%rbp)
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
	movq $0, -96(%rbp)
L119:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L96
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
	addq $-120, %rsp
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
	addq $-120, %rsp
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
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L79:
	movq -48(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L74:
	cmpq %r8, -40(%rbp)
	jle L73
	addq -40(%rbp), %r10
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L56:
	cmpq %r8, -48(%rbp)
	jl L35
L55:
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
	jmp L56
L73:
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
	jmp L74
	jmp L79
L42:
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
	jmp L35
	jmp L35
	jmp L35
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	testq -56(%rbp), -56(%rbp)
	jz L19
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -56(%rbp), %r15
	movq %r15, 8(%rdi)
L3:
	call __print__
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L19:
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call __len__
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	cmpq $0, -64(%rbp)
	setne -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -64(%rbp), %r15
	movq %r15, 8(%rdi)
	jmp L3
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
