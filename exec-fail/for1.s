	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-136, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-136, %rsp
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L104
	cmpq $1, %r10
	jle L108
	cmpq $2, %r10
	jle L110
	cmpq $3, %r10
	jle L126
	cmpq $4, %r10
	jle L152
L102:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L152:
	movq $0, -128(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L149:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -128(%rbp), %r10
	testq %r10, %r10
	jnz L146
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L102
L146:
	movq -128(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -128(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L133
L127:
	incq -128(%rbp)
	jmp L149
L133:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L127
L126:
	movq $0, -112(%rbp)
L125:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jz L102
	movq -112(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L125
L110:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L102
L108:
	cmpq $0, %rsi
	jle L106
	movq $.LC2, %rdi
L105:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L102
L106:
	movq $.LC3, %rdi
	jmp L105
L104:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L102
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-136, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -88(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-136, %rsp
	movq %rsi, -48(%rbp)
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	cmpq $0, %r10
	jle L41
	cmpq $1, %r10
	jle L41
	cmpq $2, %r10
	jle L48
	cmpq $3, %r10
	jle L85
	cmpq $4, %r10
	jle L85
L41:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L85:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L80:
	cmpq %r8, -64(%rbp)
	jle L79
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L62:
	cmpq %r8, -72(%rbp)
	jl L41
L61:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -48(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L62
L79:
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
	jmp L80
	jmp L85
L48:
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -56(%rbp)
	jmp L41
	jmp L41
	jmp L41
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-136, %rsp
	movq $0, -8(%rbp)
L39:
	movq $42, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -16(%rbp)
	movq $42, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq -16(%rbp), %r10
	movq -8(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -8(%rbp)
	jl L20
	movq $0, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L20:
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	incq -8(%rbp)
	jmp L39
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
