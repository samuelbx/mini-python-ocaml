	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L112
	cmpq $1, %r10
	jle L116
	cmpq $2, %r10
	jle L118
	cmpq $3, %r10
	jle L134
	cmpq $4, %r10
	jle L160
L110:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L160:
	movq $0, -136(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L157:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L154
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L110
L154:
	movq -136(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L141
L135:
	incq -136(%rbp)
	jmp L157
L141:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L135
L134:
	movq $0, -112(%rbp)
L133:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jz L110
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
	jmp L133
L118:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L110
L116:
	cmpq $0, %rsi
	jle L114
	movq $.LC2, %rdi
L113:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L110
L114:
	movq $.LC3, %rdi
	jmp L113
L112:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L110
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -80(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
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
	jle L49
	cmpq $1, %r10
	jle L49
	cmpq $2, %r10
	jle L56
	cmpq $3, %r10
	jle L93
	cmpq $4, %r10
	jle L93
L49:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L93:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L88:
	cmpq %r8, -64(%rbp)
	jle L87
	addq -64(%rbp), %r10
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L70:
	cmpq %r8, -72(%rbp)
	jl L49
L69:
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
	jmp L70
L87:
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
	jmp L88
	jmp L93
L56:
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
	jmp L49
	jmp L49
	jmp L49
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -16(%rbp), %r11
	movq %r8, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -88(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -88(%rbp), %r11
	movq %r10, 0(%r11)
	movq -88(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 24(%r11)
	movq -88(%rbp), %r15
	movq -16(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 32(%r11)
	movq -16(%rbp), %rdi
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
