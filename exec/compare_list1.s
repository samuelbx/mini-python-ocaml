	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
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
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L282:
	movq $0, -128(%rbp)
L281:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jnz L276
L242:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L240
L276:
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L281
L266:
	movq $0, -112(%rbp)
L265:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jz L242
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
	addq $-264, %rsp
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
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -80(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -80(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -64(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -64(%rbp), %r11
	movq %r10, 0(%r11)
	movq -64(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 16(%r11)
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -56(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -56(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $24, %rdi
	call malloc
	movq %rax, -40(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -40(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 16(%r11)
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -16(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 16(%r11)
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -16(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -16(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $32, %rdi
	call malloc
	movq %rax, -248(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -248(%rbp), %r11
	movq %r10, 0(%r11)
	movq -248(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq -248(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq -248(%rbp), %r11
	movq %r10, 24(%r11)
	movq -248(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -216(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -224(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -224(%rbp), %r11
	movq %r10, 0(%r11)
	movq -224(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -224(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -224(%rbp), %r11
	movq %r10, 24(%r11)
	movq -224(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -216(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -216(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $24, %rdi
	call malloc
	movq %rax, -200(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -200(%rbp), %r11
	movq %r10, 0(%r11)
	movq -200(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq -200(%rbp), %r11
	movq %r10, 16(%r11)
	movq -200(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -160(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -168(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -168(%rbp), %r11
	movq %r10, 0(%r11)
	movq -168(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq -168(%rbp), %r11
	movq %r10, 16(%r11)
	movq $6, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
	movq %r15, 8(%r10)
	movq -168(%rbp), %r11
	movq %r10, 24(%r11)
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -160(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -160(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $24, %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -144(%rbp), %r11
	movq %r8, 8(%r11)
	movq $5, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 16(%r11)
	movq -144(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -8(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $0, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
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
