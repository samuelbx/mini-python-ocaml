	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-272, %rsp
	movq %rdi, -136(%rbp)
	movq -136(%rbp), %r15
	movq 0(%r15), %r10
	movq -136(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L244
	cmpq $1, %r10
	jle L248
	cmpq $2, %r10
	jle L250
	cmpq $3, %r10
	jle L266
	cmpq $4, %r10
	jle L282
L240:
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L282:
	movq $0, -168(%rbp)
L281:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -176(%rbp)
	movq $2, %r8
	subq -168(%rbp), %r10
	testq %r10, %r10
	jnz L276
L242:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L240
L276:
	movq -168(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -136(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	jmp L281
L266:
	movq $0, -152(%rbp)
L265:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -160(%rbp)
	movq $2, %r8
	subq -152(%rbp), %r10
	testq %r10, %r10
	jz L242
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
	jmp L265
L250:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L242
L248:
	cmpq $0, %rsi
	jle L246
	movq $.LC2, %rdi
L245:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L242
L246:
	movq $.LC3, %rdi
	jmp L245
L244:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L242
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-272, %rsp
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
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-272, %rsp
	movq $64, %rdi
	call malloc
	movq %rax, -64(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -64(%rbp), %r11
	movq %r10, 0(%r11)
	movq -64(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 16(%r11)
	movq $0, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 24(%r11)
	movq $0, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 32(%r11)
	movq $0, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 40(%r11)
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 48(%r11)
	movq $0, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 56(%r11)
	movq -64(%rbp), %r15
	movq %r15, -184(%rbp)
	movq $0, -24(%rbp)
L175:
	movq $64, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 16(%r11)
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 24(%r11)
	movq $0, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 32(%r11)
	movq $0, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 40(%r11)
	movq $0, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 48(%r11)
	movq $0, -272(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -272(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 56(%r11)
	movq $64, %rdi
	call malloc
	movq %rax, -216(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -216(%rbp), %r11
	movq %r10, 0(%r11)
	movq -216(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 16(%r11)
	movq $0, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 24(%r11)
	movq $0, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 32(%r11)
	movq $0, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 40(%r11)
	movq $0, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 48(%r11)
	movq $0, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -224(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 56(%r11)
	movq -216(%rbp), %r15
	movq 8(%r15), %r8
	movq -48(%rbp), %r10
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -24(%rbp)
	jl L62
	movq $0, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L62:
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -184(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -192(%rbp)
	movq $0, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -192(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -192(%rbp)
	movq -192(%rbp), %r9
	movq -80(%rbp), %r10
	movq 8(%r10), %r10
	movq -184(%rbp), %r8
	addq $2, %r10
	movq $8, %rax
	imulq %rax, %r10
	addq %r8, %r10
	movq %r9, 0(%r10)
	movq -80(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -184(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	incq -24(%rbp)
	jmp L175
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
