	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L172
	cmpq $1, %r10
	jle L176
	cmpq $2, %r10
	jle L178
	cmpq $3, %r10
	jle L194
	cmpq $4, %r10
	jle L210
L168:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L210:
	movq $0, -48(%rbp)
L209:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L204
L170:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L168
L204:
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L209
L194:
	movq $0, -32(%rbp)
L193:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L170
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L193
L178:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L170
L176:
	cmpq $0, %rsi
	jle L174
	movq $.LC2, %rdi
L173:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L170
L174:
	movq $.LC3, %rdi
	jmp L173
L172:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L170
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -8(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq %rsi, -168(%rbp)
	movq %rdi, -160(%rbp)
	movq -160(%rbp), %r15
	movq 0(%r15), %r10
	movq -160(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -184(%rbp)
	movq -168(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -192(%rbp)
	cmpq $0, %r10
	jle L107
	cmpq $1, %r10
	jle L107
	cmpq $2, %r10
	jle L114
	cmpq $3, %r10
	jle L151
	cmpq $4, %r10
	jle L151
L107:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L151:
	movq -192(%rbp), %r15
	addq -184(%rbp), %r15
	movq %r15, -192(%rbp)
	movq -192(%rbp), %rdi
	call malloc
	movq %rax, %rcx
	movq $0, %r10
	addq $2, -160(%rbp)
	addq $2, %rcx
L146:
	cmpq %r10, -184(%rbp)
	jle L145
	movq $0, %r10
	addq $2, -168(%rbp)
	addq $2, %rcx
L128:
	cmpq %r10, -192(%rbp)
	jl L107
L127:
	movq $8, %r9
	movq %r10, %r8
	imulq %r9, %r8
	addq -168(%rbp), %r8
	movq 0(%r8), %r8
	movq $8, %rax
	movq %r10, %r9
	imulq %rax, %r9
	addq %rcx, %r9
	movq %r8, 0(%r9)
	incq %r10
	jmp L128
L145:
	movq $8, %r9
	movq %r10, %r8
	imulq %r9, %r8
	addq -160(%rbp), %r8
	movq 0(%r8), %r8
	movq $8, %rax
	movq %r10, %r9
	imulq %rax, %r9
	addq %rcx, %r9
	movq %r8, 0(%r9)
	incq %r10
	jmp L146
	jmp L151
L114:
	addq %r8, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -200(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -176(%rbp)
	jmp L107
	jmp L107
	jmp L107
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq $104, %rdi
	call malloc
	movq %rax, -208(%rbp)
	movq $4, %r10
	movq $11, %r8
	movq -208(%rbp), %r11
	movq %r10, 0(%r11)
	movq -208(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 32(%r11)
	movq $0, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 40(%r11)
	movq $1, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 48(%r11)
	movq $2, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 56(%r11)
	movq $3, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 64(%r11)
	movq $4, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 72(%r11)
	movq $5, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 80(%r11)
	movq $6, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 88(%r11)
	movq $7, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 96(%r11)
	movq -208(%rbp), %rdi
	call __print__
	movq $0, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
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
