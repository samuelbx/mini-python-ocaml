	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, -136(%rbp)
	movq -136(%rbp), %r15
	movq 0(%r15), %r10
	movq -136(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L130
	cmpq $1, %r10
	jle L134
	cmpq $2, %r10
	jle L136
	cmpq $3, %r10
	jle L152
	cmpq $4, %r10
	jle L178
L128:
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L178:
	movq $0, -8(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L175:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L172
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L128
L172:
	movq -8(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -136(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	subq -8(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L159
L153:
	incq -8(%rbp)
	jmp L175
L159:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L153
L152:
	movq $0, -152(%rbp)
L151:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -160(%rbp)
	movq $2, %r8
	subq -152(%rbp), %r10
	testq %r10, %r10
	jz L128
	movq -152(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -136(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -152(%rbp), %r15
	addq -160(%rbp), %r15
	movq %r15, -152(%rbp)
	jmp L151
L136:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L128
L134:
	cmpq $0, %rsi
	jle L132
	movq $.LC2, %rdi
L131:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L128
L132:
	movq $.LC3, %rdi
	jmp L131
L130:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L128
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -128(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rsi, -96(%rbp)
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -120(%rbp)
	cmpq $0, %r10
	jle L67
	cmpq $1, %r10
	jle L67
	cmpq $2, %r10
	jle L74
	cmpq $3, %r10
	jle L111
	cmpq $4, %r10
	jle L111
L67:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L111:
	movq -120(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -120(%rbp)
	movq -120(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L106:
	cmpq %r8, -112(%rbp)
	jle L105
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L88:
	cmpq %r8, -120(%rbp)
	jl L67
L87:
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
	jmp L88
L105:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -88(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L106
	jmp L111
L74:
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -112(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -104(%rbp)
	jmp L67
	jmp L67
	jmp L67
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 32(%r11)
	movq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	movq $0, -16(%rbp)
L34:
	movq -40(%rbp), %r8
	movq -40(%rbp), %r10
	movq 8(%r10), %r9
	movq -16(%rbp), %r10
	addq $2, %r10
	cmpq %r9, -16(%rbp)
	jl L27
	movq $0, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L27:
	movq $8, %r9
	imulq %r9, %r10
	addq %r8, %r10
	movq 0(%r10), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq %r10, -40(%rbp)
	movq -32(%rbp), %rdi
	call __print__
	incq -16(%rbp)
	jmp L34
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
