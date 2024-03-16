	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rdi, -152(%rbp)
	movq -152(%rbp), %r15
	movq 0(%r15), %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L297
	cmpq $1, %r10
	jle L301
	cmpq $2, %r10
	jle L303
	cmpq $3, %r10
	jle L319
	cmpq $4, %r10
	jle L335
L293:
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L335:
	movq $0, -184(%rbp)
L334:
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -192(%rbp)
	movq $2, %r8
	subq -184(%rbp), %r10
	testq %r10, %r10
	jnz L329
L295:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L293
L329:
	movq -184(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -152(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -184(%rbp), %r15
	addq -192(%rbp), %r15
	movq %r15, -184(%rbp)
	jmp L334
L319:
	movq $0, -168(%rbp)
L318:
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -176(%rbp)
	movq $2, %r8
	subq -168(%rbp), %r10
	testq %r10, %r10
	jz L295
	movq -168(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -152(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	jmp L318
L303:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L295
L301:
	cmpq $0, %rsi
	jle L299
	movq $.LC2, %rdi
L298:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L295
L299:
	movq $.LC3, %rdi
	jmp L298
L297:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L295
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rsi, -96(%rbp)
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -120(%rbp)
	cmpq $0, %r10
	jle L232
	cmpq $1, %r10
	jle L232
	cmpq $2, %r10
	jle L239
	cmpq $3, %r10
	jle L276
	cmpq $4, %r10
	jle L276
L232:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L276:
	movq -120(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -120(%rbp)
	movq -120(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L271:
	cmpq %r8, -112(%rbp)
	jle L270
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L253:
	cmpq %r8, -120(%rbp)
	jl L232
L252:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -96(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L253
L270:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -88(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L271
	jmp L276
L239:
	addq %r8, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -128(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -104(%rbp)
	jmp L232
	jmp L232
	jmp L232
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
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
	movq %rax, -296(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -296(%rbp), %r11
	movq %r10, 0(%r11)
	movq -296(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -312(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -312(%rbp), %r15
	movq %r15, 8(%r10)
	movq -296(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -304(%rbp), %r15
	movq %r15, 8(%r10)
	movq -296(%rbp), %r11
	movq %r10, 24(%r11)
	movq -296(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -264(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -272(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -272(%rbp), %r11
	movq %r10, 0(%r11)
	movq -272(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -288(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -288(%rbp), %r15
	movq %r15, 8(%r10)
	movq -272(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -280(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -280(%rbp), %r15
	movq %r15, 8(%r10)
	movq -272(%rbp), %r11
	movq %r10, 24(%r11)
	movq -272(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -264(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -264(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	movq $24, %rdi
	call malloc
	movq %rax, -248(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -248(%rbp), %r11
	movq %r10, 0(%r11)
	movq -248(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq -248(%rbp), %r11
	movq %r10, 16(%r11)
	movq -248(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -208(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -216(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -216(%rbp), %r11
	movq %r10, 0(%r11)
	movq -216(%rbp), %r11
	movq %r8, 8(%r11)
	movq $4, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 16(%r11)
	movq $6, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -216(%rbp), %r11
	movq %r10, 24(%r11)
	movq -216(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -208(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -208(%rbp), %r15
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
	movq $5, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
