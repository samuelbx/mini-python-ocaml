	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L105
	cmpq $1, %r10
	jle L109
	cmpq $2, %r10
	jle L111
	cmpq $3, %r10
	jle L127
	cmpq $4, %r10
	jle L143
L101:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L143:
	movq $0, -136(%rbp)
L142:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L137
L103:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L101
L137:
	movq -136(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -136(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -136(%rbp)
	jmp L142
L127:
	movq $0, -120(%rbp)
L126:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -128(%rbp)
	movq $2, %r8
	subq -120(%rbp), %r10
	testq %r10, %r10
	jz L103
	movq -120(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -120(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -120(%rbp)
	jmp L126
L111:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L103
L109:
	cmpq $0, %rsi
	jle L107
	movq $.LC2, %rdi
L106:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L103
L107:
	movq $.LC3, %rdi
	jmp L106
L105:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L103
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -96(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 64(%r11)
	movq -24(%rbp), %r15
	movq %r15, -8(%rbp)
	movq $7, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -16(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -8(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq $0, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
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
