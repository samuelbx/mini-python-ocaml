	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rdi, -168(%rbp)
	movq -168(%rbp), %r15
	movq 0(%r15), %r10
	movq -168(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L141
	cmpq $1, %r10
	jle L145
	cmpq $2, %r10
	jle L147
	cmpq $3, %r10
	jle L163
	cmpq $4, %r10
	jle L179
L137:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L179:
	movq $0, -32(%rbp)
L178:
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jnz L173
L139:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L137
L173:
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L178
L163:
	movq $0, -16(%rbp)
L162:
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -24(%rbp)
	movq $2, %r8
	subq -16(%rbp), %r10
	testq %r10, %r10
	jz L139
	movq -16(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -16(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -16(%rbp)
	jmp L162
L147:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L139
L145:
	cmpq $0, %rsi
	jle L143
	movq $.LC2, %rdi
L142:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L139
L143:
	movq $.LC3, %rdi
	jmp L142
L141:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L139
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -160(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rsi, -120(%rbp)
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -136(%rbp)
	movq -120(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -144(%rbp)
	cmpq $0, %r10
	jle L76
	cmpq $1, %r10
	jle L76
	cmpq $2, %r10
	jle L83
	cmpq $3, %r10
	jle L120
	cmpq $4, %r10
	jle L120
L76:
	movq -128(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L120:
	movq -144(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -144(%rbp)
	movq -144(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -112(%rbp)
	addq $2, %r10
L115:
	cmpq %r8, -136(%rbp)
	jle L114
	movq $0, %r8
	addq $2, -120(%rbp)
	addq $2, %r10
L97:
	cmpq %r8, -144(%rbp)
	jl L76
L96:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -120(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L97
L114:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -112(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L115
	jmp L120
L83:
	addq %r8, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -152(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -128(%rbp)
	jmp L76
	jmp L76
	jmp L76
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -8(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 64(%r11)
	movq -8(%rbp), %rdi
	call __len__
	movq %rax, %rdi
	call __print__
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
