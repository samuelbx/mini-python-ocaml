	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -296(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	movq %rdi, -248(%rbp)
	movq -248(%rbp), %r15
	movq 0(%r15), %r10
	movq -248(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L357
	cmpq $1, %r10
	jle L361
	cmpq $2, %r10
	jle L363
	cmpq $3, %r10
	jle L379
	cmpq $4, %r10
	jle L403
L355:
	movq -256(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L403:
	movq $0, -280(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L400:
	movq -248(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -288(%rbp)
	movq -288(%rbp), %r15
	subq -280(%rbp), %r15
	movq %r15, -288(%rbp)
	testq -288(%rbp), -288(%rbp)
	jnz L397
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L355
L397:
	movq -280(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -248(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	decq -288(%rbp)
	testq -288(%rbp), -288(%rbp)
	jnz L386
L380:
	incq -280(%rbp)
	jmp L400
L386:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L380
L379:
	movq $0, -264(%rbp)
L378:
	movq -248(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -272(%rbp)
	movq $2, %r8
	subq -264(%rbp), %r10
	testq %r10, %r10
	jz L355
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
	jmp L378
L363:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L355
L361:
	cmpq $0, %rsi
	jle L359
	movq $.LC2, %rdi
L358:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L355
L359:
	movq $.LC3, %rdi
	jmp L358
L357:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L355
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
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
	jle L294
	cmpq $1, %r10
	jle L294
	cmpq $2, %r10
	jle L301
	cmpq $3, %r10
	jle L338
	cmpq $4, %r10
	jle L338
L294:
	movq -216(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L338:
	movq -232(%rbp), %r15
	addq -224(%rbp), %r15
	movq %r15, -232(%rbp)
	movq -232(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -200(%rbp)
	addq $2, %r10
L333:
	cmpq %r8, -224(%rbp)
	jle L332
	movq $0, %r8
	addq $2, -208(%rbp)
	addq $2, %r10
L315:
	cmpq %r8, -232(%rbp)
	jl L294
L314:
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
	jmp L315
L332:
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
	jmp L333
	jmp L338
L301:
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
	jmp L294
	jmp L294
	jmp L294
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-392, %rsp
	movq $104, %rdi
	call malloc
	movq %rax, -96(%rbp)
	movq $4, %r10
	movq $11, %r8
	movq -96(%rbp), %r11
	movq %r10, 0(%r11)
	movq -96(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 32(%r11)
	movq $0, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 40(%r11)
	movq $1, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -160(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 48(%r11)
	movq $2, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 56(%r11)
	movq $3, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 64(%r11)
	movq $4, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 72(%r11)
	movq $5, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 80(%r11)
	movq $6, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 88(%r11)
	movq $7, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 96(%r11)
	movq -96(%rbp), %rdi
	call __print__
	movq $0, -24(%rbp)
L197:
	movq $96, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $10, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -88(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 16(%r11)
	movq $1, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 24(%r11)
	movq $2, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -72(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 32(%r11)
	movq $3, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 40(%r11)
	movq $4, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 48(%r11)
	movq $5, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 56(%r11)
	movq $6, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 64(%r11)
	movq $7, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 72(%r11)
	movq $8, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 80(%r11)
	movq $9, -392(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -392(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 88(%r11)
	movq $96, %rdi
	call malloc
	movq %rax, -152(%rbp)
	movq $4, %r10
	movq $10, %r8
	movq -152(%rbp), %r11
	movq %r10, 0(%r11)
	movq -152(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -384(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -384(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -376(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -376(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -368(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -368(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -360(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -360(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -352(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -352(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -344(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -344(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -336(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -336(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 64(%r11)
	movq $7, -328(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -328(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 72(%r11)
	movq $8, -312(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -312(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 80(%r11)
	movq $9, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -304(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 88(%r11)
	movq -152(%rbp), %r15
	movq 8(%r15), %r8
	movq -48(%rbp), %r10
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -24(%rbp)
	jl L20
	movq $0, -320(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -320(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L20:
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	incq -24(%rbp)
	jmp L197
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
