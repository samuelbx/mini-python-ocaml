	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-296, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -200(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -200(%rbp), %r11
	movq %r10, 0(%r11)
	movq -200(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -200(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -208(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -208(%rbp), %r11
	movq %r10, 0(%r11)
	movq -208(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 24(%r11)
	movq -208(%rbp), %r15
	movq -200(%rbp), %r11
	movq %r15, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -200(%rbp), %r11
	movq %r10, 32(%r11)
	movq -200(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -168(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -176(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -176(%rbp), %r11
	movq %r10, 0(%r11)
	movq -176(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -176(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -176(%rbp), %r11
	movq %r10, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -176(%rbp), %r11
	movq %r10, 32(%r11)
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -168(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -168(%rbp)
	movq -168(%rbp), %r15
	movq %r15, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L381
	cmpq $1, %r10
	jle L385
	cmpq $2, %r10
	jle L387
	cmpq $3, %r10
	jle L403
L377:
	movq $40, %rdi
	call malloc
	movq %rax, -112(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -112(%rbp), %r11
	movq %r10, 0(%r11)
	movq -112(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -112(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -120(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -120(%rbp), %r11
	movq %r10, 0(%r11)
	movq -120(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 24(%r11)
	movq -120(%rbp), %r15
	movq -112(%rbp), %r11
	movq %r15, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -112(%rbp), %r11
	movq %r10, 32(%r11)
	movq -112(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -80(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -80(%rbp), %r11
	movq %r10, 0(%r11)
	movq -80(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -80(%rbp), %r11
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
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 24(%r11)
	movq -96(%rbp), %r15
	movq -80(%rbp), %r11
	movq %r15, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 32(%r11)
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -72(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -72(%rbp)
	movq -72(%rbp), %r15
	movq %r15, -32(%rbp)
	movq -32(%rbp), %r15
	movq 0(%r15), %r10
	movq -32(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L242
	cmpq $1, %r10
	jle L246
	cmpq $2, %r10
	jle L248
	cmpq $3, %r10
	jle L264
L238:
	movq $40, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -24(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -24(%rbp), %r11
	movq %r10, 0(%r11)
	movq -24(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -24(%rbp), %r11
	movq %r10, 24(%r11)
	movq -24(%rbp), %r15
	movq -16(%rbp), %r11
	movq %r15, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 32(%r11)
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -280(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -288(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -288(%rbp), %r11
	movq %r10, 0(%r11)
	movq -288(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -288(%rbp), %r11
	movq %r9, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -296(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -296(%rbp), %r11
	movq %r10, 0(%r11)
	movq -296(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $2, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -296(%rbp), %r11
	movq %r9, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $3, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -296(%rbp), %r11
	movq %r9, 24(%r11)
	movq -296(%rbp), %r15
	movq -288(%rbp), %r11
	movq %r15, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -288(%rbp), %r11
	movq %r10, 32(%r11)
	movq -288(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -280(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -280(%rbp)
	movq -280(%rbp), %r15
	movq %r15, -240(%rbp)
	movq -240(%rbp), %r15
	movq 0(%r15), %r10
	movq -240(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L103
	cmpq $1, %r10
	jle L107
	cmpq $2, %r10
	jle L109
	cmpq $3, %r10
	jle L125
L99:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq %r10, -232(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -232(%rbp), %r8
	movq %r8, 16(%r10)
	movq -232(%rbp), %r8
	movq %r8, 24(%r10)
	movq -232(%rbp), %r8
	movq %r8, 32(%r10)
	movq 8(%r10), %r15
	movq %r15, -216(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, -224(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -224(%rbp), %r11
	movq %r10, 0(%r11)
	movq -224(%rbp), %r11
	movq %r8, 8(%r11)
	movq -232(%rbp), %r10
	movq -224(%rbp), %r11
	movq %r10, 16(%r11)
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -232(%rbp), %r8
	movq %r8, 16(%r10)
	movq -224(%rbp), %r11
	movq %r10, 24(%r11)
	movq -232(%rbp), %r10
	movq -224(%rbp), %r11
	movq %r10, 32(%r11)
	movq -224(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -216(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -216(%rbp)
	movq -216(%rbp), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L15
	cmpq $1, %r10
	jle L19
	cmpq $2, %r10
	jle L21
	cmpq $3, %r10
	jle L37
L11:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L37:
	movq $0, -88(%rbp)
L36:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -88(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -88(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -88(%rbp)
	jmp L36
L21:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L19:
	cmpq $0, %rsi
	jle L17
	movq $.LC2, %rdi
L16:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L17:
	movq $.LC3, %rdi
	jmp L16
L15:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L125:
	movq $0, -248(%rbp)
L124:
	movq -240(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -256(%rbp)
	movq $2, %r8
	subq -248(%rbp), %r10
	testq %r10, %r10
	jnz L119
L101:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L99
L119:
	movq -248(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -240(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -248(%rbp), %r15
	addq -256(%rbp), %r15
	movq %r15, -248(%rbp)
	jmp L124
L109:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L101
L107:
	cmpq $0, %rsi
	jle L105
	movq $.LC2, %rdi
L104:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L101
L105:
	movq $.LC3, %rdi
	jmp L104
L103:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L101
L264:
	movq $0, -40(%rbp)
L263:
	movq -32(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -48(%rbp)
	movq $2, %r8
	subq -40(%rbp), %r10
	testq %r10, %r10
	jnz L258
L240:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L238
L258:
	movq -40(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -32(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	jmp L263
L248:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L240
L246:
	cmpq $0, %rsi
	jle L244
	movq $.LC2, %rdi
L243:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L240
L244:
	movq $.LC3, %rdi
	jmp L243
L242:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L240
L403:
	movq $0, -136(%rbp)
L402:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L397
L379:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L377
L397:
	movq -136(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -136(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -136(%rbp)
	jmp L402
L387:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L379
L385:
	cmpq $0, %rsi
	jle L383
	movq $.LC2, %rdi
L382:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L379
L383:
	movq $.LC3, %rdi
	jmp L382
L381:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L379
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
