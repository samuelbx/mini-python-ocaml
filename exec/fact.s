	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -200(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq %rdi, -152(%rbp)
	movq -152(%rbp), %r15
	movq 0(%r15), %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L260
	cmpq $1, %r10
	jle L264
	cmpq $2, %r10
	jle L266
	cmpq $3, %r10
	jle L282
	cmpq $4, %r10
	jle L308
L258:
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L308:
	movq $0, -192(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L305:
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	subq -192(%rbp), %r10
	testq %r10, %r10
	jnz L302
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L258
L302:
	movq -192(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -152(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	subq -192(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L289
L283:
	incq -192(%rbp)
	jmp L305
L289:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L283
L282:
	movq $0, -176(%rbp)
L281:
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -184(%rbp)
	movq $2, %r8
	subq -176(%rbp), %r10
	testq %r10, %r10
	jz L258
	movq -176(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -152(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -176(%rbp), %r15
	addq -184(%rbp), %r15
	movq %r15, -176(%rbp)
	jmp L281
L266:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L258
L264:
	cmpq $0, %rsi
	jle L262
	movq $.LC2, %rdi
L261:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L258
L262:
	movq $.LC3, %rdi
	jmp L261
L260:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L258
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -144(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq %rsi, -112(%rbp)
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -128(%rbp)
	movq -112(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -136(%rbp)
	cmpq $0, %r10
	jle L197
	cmpq $1, %r10
	jle L197
	cmpq $2, %r10
	jle L204
	cmpq $3, %r10
	jle L241
	cmpq $4, %r10
	jle L241
L197:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L241:
	movq -136(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -136(%rbp)
	movq -136(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L236:
	cmpq %r8, -128(%rbp)
	jle L235
	movq $0, %r8
	addq $2, -112(%rbp)
	addq $2, %r10
L218:
	cmpq %r8, -136(%rbp)
	jl L197
L217:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -112(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L218
L235:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -104(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L236
	jmp L241
L204:
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -128(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -120(%rbp)
	jmp L197
	jmp L197
	jmp L197
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq $10, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -168(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_fact
	movq %rax, %rdi
	call __print__
	movq $10, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -40(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_factimp
	movq %rax, %rdi
	call __print__
	movq $0, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -232(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_fact:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq %rdi, -208(%rbp)
	movq -208(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -256(%rbp)
	movq $1, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -264(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -256(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L70
	movq -208(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -216(%rbp)
	movq -208(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -224(%rbp)
	movq $1, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	subq %r10, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -224(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_fact
	movq %rax, %r10
	movq 8(%r10), %r10
	movq -216(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -216(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
L30:
	movq %rbp, %rsp
	popq %rbp
	ret
L70:
	movq $1, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	jmp L30
def_factimp:
	pushq %rbp
	movq %rsp, %rbp
	addq $-320, %rsp
	movq %rdi, -272(%rbp)
	movq $1, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -280(%rbp)
	movq $0, -288(%rbp)
L187:
	movq -272(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -88(%rbp)
	movq -88(%rbp), %r15
	movq %r15, -64(%rbp)
	addq $2, -64(%rbp)
	movq $8, %rdi
	imulq -64(%rbp), %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -88(%rbp), %r15
	movq -56(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -80(%rbp)
L176:
	movq -80(%rbp), %r15
	movq %r15, -72(%rbp)
	addq $2, -72(%rbp)
	movq -72(%rbp), %r10
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L171
	movq -56(%rbp), %r15
	movq %r15, -296(%rbp)
	movq -272(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %r15
	movq %r15, -16(%rbp)
	addq $2, -16(%rbp)
	movq $8, %rdi
	imulq -16(%rbp), %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r15
	movq -8(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -32(%rbp)
L146:
	movq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	addq $2, -24(%rbp)
	movq -24(%rbp), %r10
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L141
	movq -8(%rbp), %r10
	movq 8(%r10), %r8
	movq -296(%rbp), %r10
	movq -288(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -288(%rbp)
	jl L122
	movq -280(%rbp), %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L122:
	movq $8, %r8
	imulq %r8, %r10
	addq -296(%rbp), %r10
	movq 0(%r10), %rsi
	movq -280(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -304(%rbp)
	movq -312(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r10
	movq -304(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -304(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -280(%rbp)
	incq -288(%rbp)
	jmp L187
L141:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -24(%rbp), %r8
	imulq %r9, %r8
	addq -8(%rbp), %r8
	movq %r10, 0(%r8)
	incq -32(%rbp)
	jmp L146
L171:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -72(%rbp), %r8
	imulq %r9, %r8
	addq -56(%rbp), %r8
	movq %r10, 0(%r8)
	incq -80(%rbp)
	jmp L176
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
