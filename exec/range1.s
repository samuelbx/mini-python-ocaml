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
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
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
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L178:
	movq $0, -160(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L175:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	subq -160(%rbp), %r10
	testq %r10, %r10
	jnz L172
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L128
L172:
	movq -160(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	subq -160(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L159
L153:
	incq -160(%rbp)
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
	movq $0, -144(%rbp)
L151:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -152(%rbp)
	movq $2, %r8
	subq -144(%rbp), %r10
	testq %r10, %r10
	jz L128
	movq -144(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -144(%rbp)
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
	movq %r15, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -120(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rsi, -88(%rbp)
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -104(%rbp)
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
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
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L111:
	movq -112(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -112(%rbp)
	movq -112(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -80(%rbp)
	addq $2, %r10
L106:
	cmpq %r8, -104(%rbp)
	jle L105
	addq -104(%rbp), %r10
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L88:
	cmpq %r8, -112(%rbp)
	jl L67
L87:
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
	jmp L88
L105:
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
	jmp L106
	jmp L111
L74:
	movq -104(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -104(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -96(%rbp)
	jmp L67
	jmp L67
	jmp L67
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -72(%rbp), %r15
	movq %r15, 8(%r8)
	movq -56(%rbp), %r11
	movq %r8, 16(%r11)
	movq $1, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq -56(%rbp), %r11
	movq %r8, 24(%r11)
	movq $2, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq -56(%rbp), %r11
	movq %r8, 32(%r11)
	movq $3, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -56(%rbp), %r11
	movq %r8, 40(%r11)
	movq $4, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -16(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 64(%r11)
	movq -56(%rbp), %rdi
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
