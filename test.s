	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq %rdi, -64(%rbp)
	movq -64(%rbp), %r15
	movq 0(%r15), %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L182
	cmpq $1, %r10
	jle L186
	cmpq $2, %r10
	jle L188
	cmpq $3, %r10
	jle L204
	cmpq $4, %r10
	jle L220
L178:
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L220:
	movq $0, -96(%rbp)
L219:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jnz L214
L180:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L178
L214:
	movq -96(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -96(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -96(%rbp)
	jmp L219
L204:
	movq $0, -80(%rbp)
L203:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jz L180
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L203
L188:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L180
L186:
	cmpq $0, %rsi
	jle L184
	movq $.LC2, %rdi
L183:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L180
L184:
	movq $.LC3, %rdi
	jmp L183
L182:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L180
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -56(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-208, %rsp
	movq $64, %rdi
	call malloc
	movq %rax, -192(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -192(%rbp), %r11
	movq %r10, 0(%r11)
	movq -192(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -192(%rbp), %r11
	movq %r8, 16(%r11)
	movq $0, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -192(%rbp), %r11
	movq %r8, 24(%r11)
	movq $0, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -192(%rbp), %r11
	movq %r8, 32(%r11)
	movq $0, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -192(%rbp), %r11
	movq %r8, 40(%r11)
	movq $0, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq -192(%rbp), %r11
	movq %r10, 48(%r11)
	movq $0, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq -192(%rbp), %r11
	movq %r10, 56(%r11)
	movq -192(%rbp), %r15
	movq %r15, -112(%rbp)
	movq $0, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -112(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq %r8, %r10
	movq 0(%r10), %rdi
	call __print__
	movq $0, -24(%rbp)
L95:
	movq $40, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 16(%r11)
	movq $0, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 24(%r11)
	movq $0, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -160(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 32(%r11)
	movq $40, %rdi
	call malloc
	movq %rax, -120(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -120(%rbp), %r11
	movq %r10, 0(%r11)
	movq -120(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 16(%r11)
	movq $0, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 24(%r11)
	movq $0, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 32(%r11)
	movq -120(%rbp), %r15
	movq 8(%r15), %r8
	movq -48(%rbp), %r10
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -24(%rbp)
	jl L30
	movq $0, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L30:
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -112(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	incq -24(%rbp)
	jmp L95
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
