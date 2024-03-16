	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-432, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -328(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-432, %rsp
	movq %rdi, -288(%rbp)
	movq -288(%rbp), %r15
	movq 0(%r15), %r10
	movq -288(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L409
	cmpq $1, %r10
	jle L413
	cmpq $2, %r10
	jle L415
	cmpq $3, %r10
	jle L431
	cmpq $4, %r10
	jle L457
L407:
	movq -296(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L457:
	movq $0, -320(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L454:
	movq -288(%rbp), %r15
	movq 8(%r15), %r10
	subq -320(%rbp), %r10
	testq %r10, %r10
	jnz L451
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L407
L451:
	movq -320(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -288(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -288(%rbp), %r15
	movq 8(%r15), %r10
	subq -320(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L438
L432:
	incq -320(%rbp)
	jmp L454
L438:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L432
L431:
	movq $0, -304(%rbp)
L430:
	movq -288(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -312(%rbp)
	movq $2, %r8
	subq -304(%rbp), %r10
	testq %r10, %r10
	jz L407
	movq -304(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -288(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -304(%rbp), %r15
	addq -312(%rbp), %r15
	movq %r15, -304(%rbp)
	jmp L430
L415:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L407
L413:
	cmpq $0, %rsi
	jle L411
	movq $.LC2, %rdi
L410:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L407
L411:
	movq $.LC3, %rdi
	jmp L410
L409:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L407
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-432, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -280(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -280(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-432, %rsp
	movq %rsi, -248(%rbp)
	movq %rdi, -240(%rbp)
	movq -240(%rbp), %r15
	movq 0(%r15), %r10
	movq -240(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -264(%rbp)
	movq -248(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -272(%rbp)
	cmpq $0, %r10
	jle L346
	cmpq $1, %r10
	jle L346
	cmpq $2, %r10
	jle L353
	cmpq $3, %r10
	jle L390
	cmpq $4, %r10
	jle L390
L346:
	movq -256(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L390:
	movq -272(%rbp), %r15
	addq -264(%rbp), %r15
	movq %r15, -272(%rbp)
	movq -272(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -240(%rbp)
	addq $2, %r10
L385:
	cmpq %r8, -264(%rbp)
	jle L384
	movq $0, %r8
	addq $2, -248(%rbp)
	addq $2, %r10
L367:
	cmpq %r8, -272(%rbp)
	jl L346
L366:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -248(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L367
L384:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -240(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L385
	jmp L390
L353:
	movq -264(%rbp), %r15
	addq -272(%rbp), %r15
	movq %r15, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -264(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -256(%rbp)
	jmp L346
	jmp L346
	jmp L346
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-432, %rsp
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
	movq %rax, -408(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -408(%rbp), %r11
	movq %r10, 0(%r11)
	movq -408(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -24(%rbp), %r15
	movq %r15, 8(%r8)
	movq -408(%rbp), %r11
	movq %r8, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -416(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -416(%rbp), %r11
	movq %r10, 0(%r11)
	movq -416(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -416(%rbp), %r11
	movq %r8, 16(%r11)
	movq $3, -432(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -432(%rbp), %r15
	movq %r15, 8(%r10)
	movq -416(%rbp), %r11
	movq %r10, 24(%r11)
	movq -416(%rbp), %r15
	movq -408(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -424(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -424(%rbp), %r15
	movq %r15, 8(%r10)
	movq -408(%rbp), %r11
	movq %r10, 32(%r11)
	movq -408(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -352(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -360(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -360(%rbp), %r11
	movq %r10, 0(%r11)
	movq -360(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -400(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -400(%rbp), %r15
	movq %r15, 8(%r10)
	movq -360(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -368(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -368(%rbp), %r11
	movq %r10, 0(%r11)
	movq -368(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -392(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -392(%rbp), %r15
	movq %r15, 8(%r10)
	movq -368(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -384(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -384(%rbp), %r15
	movq %r15, 8(%r10)
	movq -368(%rbp), %r11
	movq %r10, 24(%r11)
	movq -368(%rbp), %r15
	movq -360(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -376(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -376(%rbp), %r15
	movq %r15, 8(%r10)
	movq -360(%rbp), %r11
	movq %r10, 32(%r11)
	movq -360(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -352(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -352(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -352(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $1, -336(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -336(%rbp), %r15
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
	movq $0, -344(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -344(%rbp), %r15
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
