	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-424, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -288(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-424, %rsp
	movq %rdi, -248(%rbp)
	movq -248(%rbp), %r15
	movq 0(%r15), %r10
	movq -248(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L400
	cmpq $1, %r10
	jle L404
	cmpq $2, %r10
	jle L406
	cmpq $3, %r10
	jle L422
	cmpq $4, %r10
	jle L448
L398:
	movq -256(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L448:
	movq $0, -280(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L445:
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	subq -280(%rbp), %r10
	testq %r10, %r10
	jnz L442
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L398
L442:
	movq -280(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -248(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	subq -280(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L429
L423:
	incq -280(%rbp)
	jmp L445
L429:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L423
L422:
	movq $0, -264(%rbp)
L421:
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -272(%rbp)
	movq $2, %r8
	subq -264(%rbp), %r10
	testq %r10, %r10
	jz L398
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
	jmp L421
L406:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L398
L404:
	cmpq $0, %rsi
	jle L402
	movq $.LC2, %rdi
L401:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L398
L402:
	movq $.LC3, %rdi
	jmp L401
L400:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L398
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-424, %rsp
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-424, %rsp
	movq %rsi, -208(%rbp)
	movq %rdi, -200(%rbp)
	movq -200(%rbp), %r15
	movq 0(%r15), %r10
	movq -200(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -224(%rbp)
	movq -208(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -232(%rbp)
	cmpq $0, %r10
	jle L337
	cmpq $1, %r10
	jle L337
	cmpq $2, %r10
	jle L344
	cmpq $3, %r10
	jle L381
	cmpq $4, %r10
	jle L381
L337:
	movq -216(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L381:
	movq -232(%rbp), %r15
	addq -224(%rbp), %r15
	movq %r15, -232(%rbp)
	movq -232(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -200(%rbp)
	addq $2, %r10
L376:
	cmpq %r8, -224(%rbp)
	jle L375
	addq -224(%rbp), %r10
	movq $0, %r8
	addq $2, -208(%rbp)
	addq $2, %r10
L358:
	cmpq %r8, -232(%rbp)
	jl L337
L357:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -208(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L358
L375:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -200(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L376
	jmp L381
L344:
	movq -224(%rbp), %r15
	addq -232(%rbp), %r15
	movq %r15, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -224(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -216(%rbp)
	jmp L337
	jmp L337
	jmp L337
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-424, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -152(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -152(%rbp), %r11
	movq %r10, 0(%r11)
	movq -152(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -160(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -160(%rbp), %r11
	movq %r10, 0(%r11)
	movq -160(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 24(%r11)
	movq -160(%rbp), %r15
	movq -152(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 32(%r11)
	movq -152(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -120(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -120(%rbp), %r11
	movq %r10, 0(%r11)
	movq -120(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -136(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rax, %r10
	movq -120(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -128(%rbp)
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
	movq 8(%r15), %r10
	cmpq %r10, -112(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -112(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $40, %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -64(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -64(%rbp), %r11
	movq %r10, 0(%r11)
	movq -64(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 24(%r11)
	movq -64(%rbp), %r15
	movq -56(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 32(%r11)
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -424(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -8(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 24(%r11)
	movq -16(%rbp), %r15
	movq -8(%rbp), %r11
	movq %r15, 24(%r11)
	movq $3, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 32(%r11)
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -424(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -424(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -424(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $40, %rdi
	call malloc
	movq %rax, -368(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -368(%rbp), %r11
	movq %r10, 0(%r11)
	movq -368(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -416(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -416(%rbp), %r15
	movq %r15, 8(%r10)
	movq -368(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -376(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -376(%rbp), %r11
	movq %r10, 0(%r11)
	movq -376(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -408(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -408(%rbp), %r15
	movq %r15, 8(%r10)
	movq -376(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -400(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -400(%rbp), %r15
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
	movq %rax, %r10
	movq $1, -296(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -296(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -80(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -80(%rbp), %r8
	movq %r8, 16(%r10)
	movq -80(%rbp), %r8
	movq %r8, 24(%r10)
	movq -80(%rbp), %r8
	movq %r8, 32(%r10)
	movq 8(%r10), %r15
	movq %r15, -304(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -392(%rbp)
	movq $4, %r8
	movq $3, %r10
	movq -392(%rbp), %r11
	movq %r8, 0(%r11)
	movq -392(%rbp), %r11
	movq %r10, 8(%r11)
	movq -80(%rbp), %r10
	movq -392(%rbp), %r11
	movq %r10, 16(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -80(%rbp), %r8
	movq %r8, 16(%r10)
	movq -392(%rbp), %r11
	movq %r10, 24(%r11)
	movq -80(%rbp), %r10
	movq -392(%rbp), %r11
	movq %r10, 32(%r11)
	movq -392(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -304(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -304(%rbp), %r15
	movq %r15, 8(%rdi)
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
