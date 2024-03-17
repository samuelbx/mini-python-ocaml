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
	movq -224(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rdi, -176(%rbp)
	movq -176(%rbp), %r15
	movq 0(%r15), %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L317
	cmpq $1, %r10
	jle L321
	cmpq $2, %r10
	jle L323
	cmpq $3, %r10
	jle L339
	cmpq $4, %r10
	jle L365
L315:
	movq -184(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L365:
	movq $0, -216(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L362:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -216(%rbp), %r10
	testq %r10, %r10
	jnz L359
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L315
L359:
	movq -216(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -216(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L346
L340:
	incq -216(%rbp)
	jmp L362
L346:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L340
L339:
	movq $0, -192(%rbp)
L338:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -208(%rbp)
	movq $2, %r8
	subq -192(%rbp), %r10
	testq %r10, %r10
	jz L315
	movq -192(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -192(%rbp), %r15
	addq -208(%rbp), %r15
	movq %r15, -192(%rbp)
	jmp L338
L323:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L315
L321:
	cmpq $0, %rsi
	jle L319
	movq $.LC2, %rdi
L318:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L315
L319:
	movq $.LC3, %rdi
	jmp L318
L317:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L315
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -168(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rsi, -136(%rbp)
	movq %rdi, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -152(%rbp)
	movq -136(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -160(%rbp)
	cmpq $0, %r10
	jle L254
	cmpq $1, %r10
	jle L254
	cmpq $2, %r10
	jle L261
	cmpq $3, %r10
	jle L298
	cmpq $4, %r10
	jle L298
L254:
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L298:
	movq -160(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -160(%rbp)
	movq -160(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -128(%rbp)
	addq $2, %r10
L293:
	cmpq %r8, -152(%rbp)
	jle L292
	addq -152(%rbp), %r10
	movq $0, %r8
	addq $2, -136(%rbp)
	addq $2, %r10
L275:
	cmpq %r8, -160(%rbp)
	jl L254
L274:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -136(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L275
L292:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -128(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L293
	jmp L298
L261:
	movq -152(%rbp), %r15
	addq -160(%rbp), %r15
	movq %r15, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -152(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -144(%rbp)
	jmp L254
	jmp L254
	jmp L254
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq $360, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $43, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $113, %r10
	movq %r10, 16(%rdi)
	movq $117, %r10
	movq %r10, 24(%rdi)
	movq $101, %r10
	movq %r10, 32(%rdi)
	movq $108, %r10
	movq %r10, 40(%rdi)
	movq $113, %r10
	movq %r10, 48(%rdi)
	movq $117, %r10
	movq %r10, 56(%rdi)
	movq $101, %r10
	movq %r10, 64(%rdi)
	movq $115, %r10
	movq %r10, 72(%rdi)
	movq $32, %r10
	movq %r10, 80(%rdi)
	movq $118, %r10
	movq %r10, 88(%rdi)
	movq $97, %r10
	movq %r10, 96(%rdi)
	movq $108, %r10
	movq %r10, 104(%rdi)
	movq $101, %r10
	movq %r10, 112(%rdi)
	movq $117, %r10
	movq %r10, 120(%rdi)
	movq $114, %r10
	movq %r10, 128(%rdi)
	movq $115, %r10
	movq %r10, 136(%rdi)
	movq $32, %r10
	movq %r10, 144(%rdi)
	movq $100, %r10
	movq %r10, 152(%rdi)
	movq $101, %r10
	movq %r10, 160(%rdi)
	movq $32, %r10
	movq %r10, 168(%rdi)
	movq $108, %r10
	movq %r10, 176(%rdi)
	movq $97, %r10
	movq %r10, 184(%rdi)
	movq $32, %r10
	movq %r10, 192(%rdi)
	movq $115, %r10
	movq %r10, 200(%rdi)
	movq $117, %r10
	movq %r10, 208(%rdi)
	movq $105, %r10
	movq %r10, 216(%rdi)
	movq $116, %r10
	movq %r10, 224(%rdi)
	movq $101, %r10
	movq %r10, 232(%rdi)
	movq $32, %r10
	movq %r10, 240(%rdi)
	movq $100, %r10
	movq %r10, 248(%rdi)
	movq $101, %r10
	movq %r10, 256(%rdi)
	movq $32, %r10
	movq %r10, 264(%rdi)
	movq $70, %r10
	movq %r10, 272(%rdi)
	movq $105, %r10
	movq %r10, 280(%rdi)
	movq $98, %r10
	movq %r10, 288(%rdi)
	movq $111, %r10
	movq %r10, 296(%rdi)
	movq $110, %r10
	movq %r10, 304(%rdi)
	movq $97, %r10
	movq %r10, 312(%rdi)
	movq $99, %r10
	movq %r10, 320(%rdi)
	movq $99, %r10
	movq %r10, 328(%rdi)
	movq $105, %r10
	movq %r10, 336(%rdi)
	movq $32, %r10
	movq %r10, 344(%rdi)
	movq $58, %r10
	movq %r10, 352(%rdi)
	call __print__
	movq %rax, %r10
	movq $0, -256(%rbp)
L93:
	movq $48, %rdi
	call malloc
	movq %rax, -280(%rbp)
	movq $4, %r10
	movq $4, %r8
	movq -280(%rbp), %r11
	movq %r10, 0(%r11)
	movq -280(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -296(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -296(%rbp), %r15
	movq %r15, 8(%r10)
	movq -280(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -288(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -288(%rbp), %r15
	movq %r15, 8(%r10)
	movq -280(%rbp), %r11
	movq %r10, 24(%r11)
	movq $11, -272(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -272(%rbp), %r15
	movq %r15, 8(%r10)
	movq -280(%rbp), %r11
	movq %r10, 32(%r11)
	movq $42, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq -280(%rbp), %r11
	movq %r10, 40(%r11)
	movq $48, %rdi
	call malloc
	movq %rax, -72(%rbp)
	movq $4, %r10
	movq $4, %r8
	movq -72(%rbp), %r11
	movq %r10, 0(%r11)
	movq -72(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 24(%r11)
	movq $11, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 32(%r11)
	movq $42, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 40(%r11)
	movq -72(%rbp), %r15
	movq 8(%r15), %r8
	movq -280(%rbp), %r10
	movq -256(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -256(%rbp)
	jl L12
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L12:
	movq $8, %r8
	imulq %r8, %r10
	addq -280(%rbp), %r10
	movq 0(%r10), %rdi
	call def_fib
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	incq -256(%rbp)
	jmp L93
def_fibaux:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rdx, -24(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -8(%rbp)
	movq -24(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -80(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L192
	movq -16(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rsi
	movq -64(%rbp), %rdi
	call __add__
	movq %rax, -32(%rbp)
	movq -24(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	movq $1, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	subq %r10, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdx
	movq $2, %r10
	movq %r10, 0(%rdx)
	movq -48(%rbp), %r15
	movq %r15, 8(%rdx)
	movq -32(%rbp), %rsi
	movq -40(%rbp), %rdi
	call def_fibaux
L189:
	movq %rbp, %rsp
	popq %rbp
	ret
L192:
	movq -8(%rbp), %rax
	jmp L189
def_fib:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq %rdi, -96(%rbp)
	movq $0, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -120(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -104(%rbp)
	movq $1, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -112(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -96(%rbp), %rdx
	movq -104(%rbp), %rdi
	call def_fibaux
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
