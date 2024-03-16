	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L111
	cmpq $1, %r10
	jle L115
	cmpq $2, %r10
	jle L117
	cmpq $3, %r10
	jle L133
	cmpq $4, %r10
	jle L149
L107:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L149:
	movq $0, -144(%rbp)
L148:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -152(%rbp)
	movq $2, %r8
	subq -144(%rbp), %r10
	testq %r10, %r10
	jnz L143
L109:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L107
L143:
	movq -144(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -144(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -144(%rbp)
	jmp L148
L133:
	movq $0, -128(%rbp)
L132:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L109
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L132
L117:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
L115:
	cmpq $0, %rsi
	jle L113
	movq $.LC2, %rdi
L112:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
L113:
	movq $.LC3, %rdi
	jmp L112
L111:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -104(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $42, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -8(%rbp)
	movq -8(%rbp), %rdi
	call __print__
	movq $0, -16(%rbp)
L87:
	movq $40, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 32(%r11)
	movq $40, %rdi
	call malloc
	movq %rax, -32(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -32(%rbp), %r11
	movq %r10, 0(%r11)
	movq -32(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 32(%r11)
	movq -32(%rbp), %r15
	movq 8(%r15), %r8
	movq -24(%rbp), %r10
	movq -16(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -16(%rbp)
	jl L22
	movq -8(%rbp), %rdi
	call __print__
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L22:
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %rdi
	call __print__
	incq -16(%rbp)
	jmp L87
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
