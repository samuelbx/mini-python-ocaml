	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-352, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -264(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -264(%rbp)
	movq -264(%rbp), %r15
	movq %r15, -216(%rbp)
	movq -216(%rbp), %r15
	movq 0(%r15), %r10
	movq -216(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L408
	cmpq $1, %r10
	jle L412
	cmpq $2, %r10
	jle L414
	cmpq $3, %r10
	jle L430
L404:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -200(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -208(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -208(%rbp), %r11
	movq %r10, 0(%r11)
	movq -208(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -208(%rbp), %r11
	movq %r10, 16(%r11)
	movq -208(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -200(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -200(%rbp)
	movq -200(%rbp), %r15
	movq %r15, -160(%rbp)
	movq -160(%rbp), %r15
	movq 0(%r15), %r10
	movq -160(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L339
	cmpq $1, %r10
	jle L343
	cmpq $2, %r10
	jle L345
	cmpq $3, %r10
	jle L361
L335:
	movq $24, %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -144(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 16(%r11)
	movq -144(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -128(%rbp)
	movq $24, %rdi
	call malloc
	movq %rax, -136(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -136(%rbp), %r11
	movq %r10, 0(%r11)
	movq -136(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -136(%rbp), %r11
	movq %r10, 16(%r11)
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -128(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -128(%rbp)
	movq -128(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L262
	cmpq $1, %r10
	jle L266
	cmpq $2, %r10
	jle L268
	cmpq $3, %r10
	jle L284
L258:
	movq $32, %rdi
	call malloc
	movq %rax, -72(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -72(%rbp), %r11
	movq %r10, 0(%r11)
	movq -72(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 24(%r11)
	movq -72(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -56(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -64(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -64(%rbp), %r11
	movq %r10, 0(%r11)
	movq -64(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 24(%r11)
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -56(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -56(%rbp)
	movq -56(%rbp), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L169
	cmpq $1, %r10
	jle L173
	cmpq $2, %r10
	jle L175
	cmpq $3, %r10
	jle L191
L165:
	movq $24, %rdi
	call malloc
	movq %rax, -352(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -352(%rbp), %r11
	movq %r10, 0(%r11)
	movq -352(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -352(%rbp), %r11
	movq %r10, 16(%r11)
	movq -352(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -336(%rbp)
	movq $32, %rdi
	call malloc
	movq %rax, -344(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -344(%rbp), %r11
	movq %r10, 0(%r11)
	movq -344(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -344(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $6, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -344(%rbp), %r11
	movq %r10, 24(%r11)
	movq -344(%rbp), %r15
	movq 8(%r15), %r10
	cmpq %r10, -336(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -336(%rbp)
	movq -336(%rbp), %r15
	movq %r15, -296(%rbp)
	movq -296(%rbp), %r15
	movq 0(%r15), %r10
	movq -296(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L84
	cmpq $1, %r10
	jle L88
	cmpq $2, %r10
	jle L90
	cmpq $3, %r10
	jle L106
L80:
	movq $24, %rdi
	call malloc
	movq %rax, -288(%rbp)
	movq $4, %r10
	movq $1, %r8
	movq -288(%rbp), %r11
	movq %r10, 0(%r11)
	movq -288(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $5, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -288(%rbp), %r11
	movq %r10, 16(%r11)
	movq -288(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -280(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -280(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -280(%rbp)
	movq -280(%rbp), %r15
	movq %r15, -32(%rbp)
	movq -32(%rbp), %r15
	movq 0(%r15), %r10
	movq -32(%rbp), %r15
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
	movq $0, -104(%rbp)
L36:
	movq -32(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -152(%rbp)
	movq $2, %r8
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -104(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -32(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -104(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -104(%rbp)
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
L106:
	movq $0, -304(%rbp)
L105:
	movq -296(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -312(%rbp)
	movq $2, %r8
	subq -304(%rbp), %r10
	testq %r10, %r10
	jnz L100
L82:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L80
L100:
	movq -304(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -296(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -304(%rbp), %r15
	addq -312(%rbp), %r15
	movq %r15, -304(%rbp)
	jmp L105
L90:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
L88:
	cmpq $0, %rsi
	jle L86
	movq $.LC2, %rdi
L85:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
L86:
	movq $.LC3, %rdi
	jmp L85
L84:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L82
L191:
	movq $0, -16(%rbp)
L190:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -24(%rbp)
	movq $2, %r8
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L185
L167:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L165
L185:
	movq -16(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -16(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -16(%rbp)
	jmp L190
L175:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L167
L173:
	cmpq $0, %rsi
	jle L171
	movq $.LC2, %rdi
L170:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L167
L171:
	movq $.LC3, %rdi
	jmp L170
L169:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L167
L284:
	movq $0, -88(%rbp)
L283:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jnz L278
L260:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L258
L278:
	movq -88(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -88(%rbp), %r15
	addq -96(%rbp), %r15
	movq %r15, -88(%rbp)
	jmp L283
L268:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L260
L266:
	cmpq $0, %rsi
	jle L264
	movq $.LC2, %rdi
L263:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L260
L264:
	movq $.LC3, %rdi
	jmp L263
L262:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L260
L361:
	movq $0, -168(%rbp)
L360:
	movq -160(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -176(%rbp)
	movq $2, %r8
	subq -168(%rbp), %r10
	testq %r10, %r10
	jnz L355
L337:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L335
L355:
	movq -168(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -160(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	jmp L360
L345:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L337
L343:
	cmpq $0, %rsi
	jle L341
	movq $.LC2, %rdi
L340:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L337
L341:
	movq $.LC3, %rdi
	jmp L340
L339:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L337
L430:
	movq $0, -224(%rbp)
L429:
	movq -216(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -232(%rbp)
	movq $2, %r8
	subq -224(%rbp), %r10
	testq %r10, %r10
	jnz L424
L406:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L404
L424:
	movq -224(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -216(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -224(%rbp), %r15
	addq -232(%rbp), %r15
	movq %r15, -224(%rbp)
	jmp L429
L414:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L406
L412:
	cmpq $0, %rsi
	jle L410
	movq $.LC2, %rdi
L409:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L406
L410:
	movq $.LC3, %rdi
	jmp L409
L408:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L406
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
