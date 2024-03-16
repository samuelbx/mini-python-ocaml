	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	movq %rdi, -248(%rbp)
	movq -248(%rbp), %r15
	movq 0(%r15), %r10
	movq -248(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L358
	cmpq $1, %r10
	jle L362
	cmpq $2, %r10
	jle L364
	cmpq $3, %r10
	jle L380
	cmpq $4, %r10
	jle L396
L354:
	movq -256(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L396:
	movq $0, -280(%rbp)
L395:
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -288(%rbp)
	movq $2, %r8
	subq -280(%rbp), %r10
	testq %r10, %r10
	jnz L390
L356:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L354
L390:
	movq -280(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -248(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -280(%rbp), %r15
	addq -288(%rbp), %r15
	movq %r15, -280(%rbp)
	jmp L395
L380:
	movq $0, -264(%rbp)
L379:
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -272(%rbp)
	movq $2, %r8
	subq -264(%rbp), %r10
	testq %r10, %r10
	jz L356
	movq -264(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -248(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -264(%rbp), %r15
	addq -272(%rbp), %r15
	movq %r15, -264(%rbp)
	jmp L379
L364:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L356
L362:
	cmpq $0, %rsi
	jle L360
	movq $.LC2, %rdi
L359:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L356
L360:
	movq $.LC3, %rdi
	jmp L359
L358:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L356
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -240(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -184(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -184(%rbp), %r11
	movq %r10, 0(%r11)
	movq -184(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -184(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -192(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -192(%rbp), %r11
	movq %r10, 0(%r11)
	movq -192(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -224(%rbp), %r15
	movq %r15, 8(%r10)
	movq -192(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -216(%rbp), %r15
	movq %r15, 8(%r10)
	movq -192(%rbp), %r11
	movq %r10, 24(%r11)
	movq -192(%rbp), %r15
	movq -184(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq -184(%rbp), %r11
	movq %r10, 32(%r11)
	movq -184(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -144(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -152(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -152(%rbp), %r11
	movq %r10, 0(%r11)
	movq -152(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -160(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 32(%r11)
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -144(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -144(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $40, %rdi
	call malloc
	movq %rax, -88(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -88(%rbp), %r11
	movq %r10, 0(%r11)
	movq -88(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -96(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -96(%rbp), %r11
	movq %r10, 0(%r11)
	movq -96(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 24(%r11)
	movq -96(%rbp), %r15
	movq -88(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 32(%r11)
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -32(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -40(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -40(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 24(%r11)
	movq -48(%rbp), %r15
	movq -40(%rbp), %r11
	movq %r15, 24(%r11)
	movq $3, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 32(%r11)
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -32(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -32(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $40, %rdi
	call malloc
	movq %rax, -368(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -368(%rbp), %r11
	movq %r10, 0(%r11)
	movq -368(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -24(%rbp), %r15
	movq %r15, 8(%r8)
	movq -368(%rbp), %r11
	movq %r8, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -376(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -376(%rbp), %r11
	movq %r10, 0(%r11)
	movq -376(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -376(%rbp), %r11
	movq %r8, 16(%r11)
	movq $3, -392(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -392(%rbp), %r15
	movq %r15, 8(%r10)
	movq -376(%rbp), %r11
	movq %r10, 24(%r11)
	movq -376(%rbp), %r15
	movq -368(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -384(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -384(%rbp), %r15
	movq %r15, 8(%r10)
	movq -368(%rbp), %r11
	movq %r10, 32(%r11)
	movq -368(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -312(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -320(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -320(%rbp), %r11
	movq %r10, 0(%r11)
	movq -320(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -360(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -360(%rbp), %r15
	movq %r15, 8(%r10)
	movq -320(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -328(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -328(%rbp), %r11
	movq %r10, 0(%r11)
	movq -328(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -352(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -352(%rbp), %r15
	movq %r15, 8(%r10)
	movq -328(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -344(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -344(%rbp), %r15
	movq %r15, 8(%r10)
	movq -328(%rbp), %r11
	movq %r10, 24(%r11)
	movq -328(%rbp), %r15
	movq -320(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -336(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -336(%rbp), %r15
	movq %r15, 8(%r10)
	movq -320(%rbp), %r11
	movq %r10, 32(%r11)
	movq -320(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -312(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -312(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -312(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $1, -296(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -296(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -208(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -208(%rbp), %r8
	movq %r8, 16(%r10)
	movq -208(%rbp), %r8
	movq %r8, 24(%r10)
	movq -208(%rbp), %r8
	movq %r8, 32(%r10)
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -112(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -112(%rbp), %r11
	movq %r10, 0(%r11)
	movq -112(%rbp), %r11
	movq %r8, 8(%r11)
	movq -208(%rbp), %r10
	movq -112(%rbp), %r11
	movq %r10, 16(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -208(%rbp), %r8
	movq %r8, 16(%r10)
	movq -112(%rbp), %r11
	movq %r10, 24(%r11)
	movq -208(%rbp), %r10
	movq -112(%rbp), %r11
	movq %r10, 32(%r11)
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -8(%rbp)
	sete %r11b
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
	movq $0, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -304(%rbp), %r15
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
