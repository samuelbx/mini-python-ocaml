	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-272, %rsp
	movq %rdi, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L232
	cmpq $1, %r10
	jle L236
	cmpq $2, %r10
	jle L238
	cmpq $3, %r10
	jle L254
	cmpq $4, %r10
	jle L270
L228:
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L270:
	movq $0, -160(%rbp)
L269:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -168(%rbp)
	movq $2, %r8
	subq -160(%rbp), %r10
	testq %r10, %r10
	jnz L264
L230:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L228
L264:
	movq -160(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -160(%rbp), %r15
	addq -168(%rbp), %r15
	movq %r15, -160(%rbp)
	jmp L269
L254:
	movq $0, -144(%rbp)
L253:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -152(%rbp)
	movq $2, %r8
	subq -144(%rbp), %r10
	testq %r10, %r10
	jz L230
	movq -144(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -144(%rbp)
	jmp L253
L238:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L230
L236:
	cmpq $0, %rsi
	jle L234
	movq $.LC2, %rdi
L233:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L230
L234:
	movq $.LC3, %rdi
	jmp L233
L232:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L230
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-272, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -120(%rbp), %r15
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
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 24(%r11)
	movq $4, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 32(%r11)
	movq $5, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 40(%r11)
	movq $7, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 48(%r11)
	movq $12, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 56(%r11)
	movq -56(%rbp), %r15
	movq %r15, -176(%rbp)
	movq $0, -24(%rbp)
L163:
	movq $64, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 16(%r11)
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 24(%r11)
	movq $2, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 32(%r11)
	movq $3, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 40(%r11)
	movq $4, -272(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -272(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 56(%r11)
	movq $64, %rdi
	call malloc
	movq %rax, -208(%rbp)
	movq $4, %r10
	movq $6, %r8
	movq -208(%rbp), %r11
	movq %r10, 0(%r11)
	movq -208(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -224(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -216(%rbp), %r15
	movq %r15, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 56(%r11)
	movq -208(%rbp), %r15
	movq 8(%r15), %r8
	movq -48(%rbp), %r10
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -24(%rbp)
	jl L50
	movq $0, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L50:
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -176(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -184(%rbp)
	movq $1, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	addq %r10, -184(%rbp)
	movq -184(%rbp), %r9
	movq -80(%rbp), %r10
	movq 8(%r10), %r10
	movq -176(%rbp), %r8
	addq $2, %r10
	movq $8, %rax
	imulq %rax, %r10
	addq %r8, %r10
	movq %r9, 0(%r10)
	incq -24(%rbp)
	jmp L163
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
