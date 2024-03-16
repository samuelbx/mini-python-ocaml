	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %r15
	movq 0(%r15), %r10
	movq -144(%rbp), %r15
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
	jle L324
L282:
	movq -152(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L324:
	movq $0, -184(%rbp)
L323:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -192(%rbp)
	movq $2, %r8
	subq -184(%rbp), %r10
	testq %r10, %r10
	jnz L318
L284:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L282
L318:
	movq -184(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -184(%rbp), %r15
	addq -192(%rbp), %r15
	movq %r15, -184(%rbp)
	jmp L323
L308:
	movq $0, -168(%rbp)
L307:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -176(%rbp)
	movq $2, %r8
	subq -168(%rbp), %r10
	testq %r10, %r10
	jz L284
	movq -168(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
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
	addq $-264, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -136(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
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
	movq $0, -8(%rbp)
L102:
	movq $48, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $4, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 24(%r11)
	movq $11, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 32(%r11)
	movq $42, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 40(%r11)
	movq $48, %rdi
	call malloc
	movq %rax, -160(%rbp)
	movq $4, %r10
	movq $4, %r8
	movq -160(%rbp), %r11
	movq %r10, 0(%r11)
	movq -160(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -216(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 24(%r11)
	movq $11, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 32(%r11)
	movq $42, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq -160(%rbp), %r11
	movq %r10, 40(%r11)
	movq -160(%rbp), %r15
	movq 8(%r15), %r8
	movq -16(%rbp), %r10
	movq -8(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -8(%rbp)
	jl L21
	movq $0, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -224(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L21:
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call def_fib
	movq %rax, %rdi
	call __print__
	incq -8(%rbp)
	jmp L102
def_fibaux:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
	movq %rdx, -40(%rbp)
	movq %rsi, -32(%rbp)
	movq %rdi, -24(%rbp)
	movq -40(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -88(%rbp)
	movq $0, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -88(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L202
	movq -32(%rbp), %r15
	movq %r15, -56(%rbp)
	movq -24(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq -32(%rbp), %r10
	movq 8(%r10), %r10
	addq %r10, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -48(%rbp)
	movq -40(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	movq $1, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	subq %r10, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdx
	movq $2, %r10
	movq %r10, 0(%rdx)
	movq -64(%rbp), %r15
	movq %r15, 8(%rdx)
	movq -48(%rbp), %rsi
	movq -56(%rbp), %rdi
	call def_fibaux
	movq %rax, %r10
	movq 8(%r10), %rax
L198:
	movq %rbp, %rsp
	popq %rbp
	ret
L202:
	movq -24(%rbp), %r10
	movq 8(%r10), %rax
	jmp L198
def_fib:
	pushq %rbp
	movq %rsp, %rbp
	addq $-264, %rsp
	movq %rdi, -104(%rbp)
	movq $0, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -128(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -112(%rbp)
	movq $1, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -120(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -104(%rbp), %rdx
	movq -112(%rbp), %rdi
	call def_fibaux
	movq %rax, %r10
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
