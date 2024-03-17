	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -152(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L286
	cmpq $1, %r10
	jle L290
	cmpq $2, %r10
	jle L292
	cmpq $3, %r10
	jle L308
	cmpq $4, %r10
	jle L334
L284:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L334:
	movq $0, -144(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L331:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -144(%rbp), %r10
	testq %r10, %r10
	jnz L328
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L284
L328:
	movq -144(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -144(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L315
L309:
	incq -144(%rbp)
	jmp L331
L315:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L309
L308:
	movq $0, -128(%rbp)
L307:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L284
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
	jmp L307
L292:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L284
L290:
	cmpq $0, %rsi
	jle L288
	movq $.LC2, %rdi
L287:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L284
L288:
	movq $.LC3, %rdi
	jmp L287
L286:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L284
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rsi, -64(%rbp)
	movq %rdi, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	movq -64(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -88(%rbp)
	cmpq $0, %r10
	jle L223
	cmpq $1, %r10
	jle L223
	cmpq $2, %r10
	jle L230
	cmpq $3, %r10
	jle L267
	cmpq $4, %r10
	jle L267
L223:
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L267:
	movq -88(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -88(%rbp)
	movq -88(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L262:
	cmpq %r8, -80(%rbp)
	jle L261
	addq -80(%rbp), %r10
	movq $0, %r8
	addq $2, -64(%rbp)
	addq $2, %r10
L244:
	cmpq %r8, -88(%rbp)
	jl L223
L243:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -64(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L244
L261:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -56(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L262
	jmp L267
L230:
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -72(%rbp)
	jmp L223
	jmp L223
	jmp L223
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -48(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -48(%rbp), %r15
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
	movq %r15, -16(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -32(%rbp)
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
	setl %r11b
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
	movq $24, %rdi
	call malloc
	movq %rax, -296(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -296(%rbp), %r11
	movq %r10, 0(%r11)
	movq -296(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq -296(%rbp), %r11
	movq %r10, 16(%r11)
	movq -296(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -272(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -280(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -280(%rbp), %r11
	movq %r10, 0(%r11)
	movq -280(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -288(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -288(%rbp), %r15
	movq %r15, 8(%r10)
	movq -280(%rbp), %r11
	movq %r10, 16(%r11)
	movq -280(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -272(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -272(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -272(%rbp), %r15
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
	movq %rax, -40(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -40(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r11
	movq %r8, 8(%r11)
	movq $5, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 16(%r11)
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $4, %r9
	movq $0, %r10
	movq %r9, 0(%r8)
	movq %r10, 8(%r8)
	movq 8(%r8), %r10
	cmpq %r10, -176(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -176(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
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
