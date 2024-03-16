	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -624(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdi, -576(%rbp)
	movq -576(%rbp), %r15
	movq 0(%r15), %r10
	movq -576(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L648
	cmpq $1, %r10
	jle L652
	cmpq $2, %r10
	jle L654
	cmpq $3, %r10
	jle L670
	cmpq $4, %r10
	jle L696
L646:
	movq -584(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L696:
	movq $0, -608(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L693:
	movq -576(%rbp), %r15
	movq 8(%r15), %r10
	subq -608(%rbp), %r10
	testq %r10, %r10
	jnz L690
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L646
L690:
	movq -608(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -576(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -576(%rbp), %r15
	movq 8(%r15), %r10
	subq -608(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L677
L671:
	incq -608(%rbp)
	jmp L693
L677:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L671
L670:
	movq $0, -592(%rbp)
L669:
	movq -576(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -600(%rbp)
	movq $2, %r8
	subq -592(%rbp), %r10
	testq %r10, %r10
	jz L646
	movq -592(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -576(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -592(%rbp), %r15
	addq -600(%rbp), %r15
	movq %r15, -592(%rbp)
	jmp L669
L654:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L646
L652:
	cmpq $0, %rsi
	jle L650
	movq $.LC2, %rdi
L649:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L646
L650:
	movq $.LC3, %rdi
	jmp L649
L648:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L646
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -568(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -568(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rsi, -528(%rbp)
	movq %rdi, -520(%rbp)
	movq -520(%rbp), %r15
	movq 0(%r15), %r10
	movq -520(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -544(%rbp)
	movq -528(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -552(%rbp)
	cmpq $0, %r10
	jle L585
	cmpq $1, %r10
	jle L585
	cmpq $2, %r10
	jle L592
	cmpq $3, %r10
	jle L629
	cmpq $4, %r10
	jle L629
L585:
	movq -536(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L629:
	movq -552(%rbp), %r15
	addq -544(%rbp), %r15
	movq %r15, -552(%rbp)
	movq -552(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -520(%rbp)
	addq $2, %r10
L624:
	cmpq %r8, -544(%rbp)
	jle L623
	movq $0, %r8
	addq $2, -528(%rbp)
	addq $2, %r10
L606:
	cmpq %r8, -552(%rbp)
	jl L585
L605:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -528(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L606
L623:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -520(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L624
	jmp L629
L592:
	movq -544(%rbp), %r15
	addq -552(%rbp), %r15
	movq %r15, -544(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -544(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -536(%rbp)
	jmp L585
	jmp L585
	jmp L585
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq $0, -24(%rbp)
L182:
	movq $88, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $9, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 16(%r11)
	movq $1, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -56(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 24(%r11)
	movq $2, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 32(%r11)
	movq $3, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 40(%r11)
	movq $4, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 48(%r11)
	movq $5, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 56(%r11)
	movq $6, -688(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -688(%rbp), %r15
	movq %r15, 8(%r8)
	movq -48(%rbp), %r11
	movq %r8, 64(%r11)
	movq $7, -680(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -680(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 72(%r11)
	movq $8, -672(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -672(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 80(%r11)
	movq $88, %rdi
	call malloc
	movq %rax, -152(%rbp)
	movq $4, %r10
	movq $9, %r8
	movq -152(%rbp), %r11
	movq %r10, 0(%r11)
	movq -152(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -664(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -664(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -656(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -656(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -648(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -648(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -640(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -640(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -632(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -632(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -616(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -616(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -560(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -560(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 64(%r11)
	movq $7, -424(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -424(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 72(%r11)
	movq $8, -328(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -328(%rbp), %r15
	movq %r15, 8(%r10)
	movq -152(%rbp), %r11
	movq %r10, 80(%r11)
	movq -152(%rbp), %r15
	movq 8(%r15), %r8
	movq -48(%rbp), %r10
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -24(%rbp)
	jl L21
	movq $0, -480(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -480(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L21:
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call def_q
	movq %rax, %rdi
	call __print__
	incq -24(%rbp)
	jmp L182
def_abs:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r10
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
	setl %r11b
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
	jnz L191
	movq -72(%rbp), %r10
	movq 8(%r10), %rax
L184:
	movq %rbp, %rsp
	popq %rbp
	ret
L191:
	movq -72(%rbp), %r10
	movq 8(%r10), %r8
	movq $0, %r10
	subq %r8, %r10
	movq 8(%r10), %rax
	jmp L184
def_check:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdx, %r10
	movq %rsi, -104(%rbp)
	movq %rdi, -96(%rbp)
	movq $0, -112(%rbp)
L398:
	movq -104(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -248(%rbp)
	movq -248(%rbp), %r15
	movq %r15, -224(%rbp)
	addq $2, -224(%rbp)
	movq $8, %rdi
	imulq -224(%rbp), %rdi
	call malloc
	movq %rax, -216(%rbp)
	movq $4, %r10
	movq -216(%rbp), %r11
	movq %r10, 0(%r11)
	movq -248(%rbp), %r15
	movq -216(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -240(%rbp)
L387:
	movq -240(%rbp), %r15
	movq %r15, -232(%rbp)
	addq $2, -232(%rbp)
	movq -232(%rbp), %r10
	subq -224(%rbp), %r10
	testq %r10, %r10
	jnz L382
	movq -216(%rbp), %r15
	movq %r15, -120(%rbp)
	movq -104(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -208(%rbp)
	movq -208(%rbp), %r15
	movq %r15, -184(%rbp)
	addq $2, -184(%rbp)
	movq $8, %rdi
	imulq -184(%rbp), %rdi
	call malloc
	movq %rax, -176(%rbp)
	movq $4, %r10
	movq -176(%rbp), %r11
	movq %r10, 0(%r11)
	movq -208(%rbp), %r15
	movq -176(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -200(%rbp)
L357:
	movq -200(%rbp), %r15
	movq %r15, -192(%rbp)
	addq $2, -192(%rbp)
	movq -192(%rbp), %r10
	subq -184(%rbp), %r10
	testq %r10, %r10
	jnz L352
	movq -176(%rbp), %r10
	movq 8(%r10), %r8
	movq -120(%rbp), %r10
	movq -112(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -112(%rbp)
	jl L333
L224:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L333:
	movq $8, %r8
	imulq %r8, %r10
	addq -120(%rbp), %r10
	movq 0(%r10), %r15
	movq %r15, -128(%rbp)
	movq -104(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -96(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq -128(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -96(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r10
	cmpq %r10, -168(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jz L293
	movq $1, %r10
L237:
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L234
	incq -112(%rbp)
	jmp L398
L234:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	jmp L224
L293:
	movq -104(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -96(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -160(%rbp)
	movq -128(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -96(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r10
	subq %r10, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -160(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_abs
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -136(%rbp)
	movq -104(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -144(%rbp)
	movq -128(%rbp), %r10
	movq 8(%r10), %r10
	subq %r10, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -144(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_abs
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -136(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq $0, %r10
	setne %r10b
	jmp L237
L352:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -192(%rbp), %r8
	imulq %r9, %r8
	addq -176(%rbp), %r8
	movq %r10, 0(%r8)
	incq -200(%rbp)
	jmp L357
L382:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -240(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -232(%rbp), %r8
	imulq %r9, %r8
	addq -216(%rbp), %r8
	movq %r10, 0(%r8)
	incq -240(%rbp)
	jmp L387
def_count:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdx, -272(%rbp)
	movq %rsi, -264(%rbp)
	movq %rdi, -256(%rbp)
	movq -264(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -440(%rbp)
	movq -272(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -440(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -440(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -440(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L527
	movq $0, -416(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -416(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -280(%rbp)
	movq $0, -288(%rbp)
L509:
	movq -272(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -408(%rbp)
	movq -408(%rbp), %r15
	movq %r15, -384(%rbp)
	addq $2, -384(%rbp)
	movq $8, %rdi
	imulq -384(%rbp), %rdi
	call malloc
	movq %rax, -376(%rbp)
	movq $4, %r10
	movq -376(%rbp), %r11
	movq %r10, 0(%r11)
	movq -408(%rbp), %r15
	movq -376(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -400(%rbp)
L498:
	movq -400(%rbp), %r15
	movq %r15, -392(%rbp)
	addq $2, -392(%rbp)
	movq -392(%rbp), %r10
	subq -384(%rbp), %r10
	testq %r10, %r10
	jnz L493
	movq -376(%rbp), %r15
	movq %r15, -296(%rbp)
	movq -272(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -368(%rbp)
	movq -368(%rbp), %r15
	movq %r15, -344(%rbp)
	addq $2, -344(%rbp)
	movq $8, %rdi
	imulq -344(%rbp), %rdi
	call malloc
	movq %rax, -336(%rbp)
	movq $4, %r10
	movq -336(%rbp), %r11
	movq %r10, 0(%r11)
	movq -368(%rbp), %r15
	movq -336(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -360(%rbp)
L468:
	movq -360(%rbp), %r15
	movq %r15, -352(%rbp)
	addq $2, -352(%rbp)
	movq -352(%rbp), %r10
	subq -344(%rbp), %r10
	testq %r10, %r10
	jnz L463
	movq -336(%rbp), %r10
	movq 8(%r10), %r8
	movq -296(%rbp), %r10
	movq -288(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -288(%rbp)
	jl L444
	movq -280(%rbp), %r10
	movq 8(%r10), %rax
L400:
	movq %rbp, %rsp
	popq %rbp
	ret
L444:
	movq $8, %r8
	imulq %r8, %r10
	addq -296(%rbp), %r10
	movq 0(%r10), %r10
	movq -264(%rbp), %r8
	movq 8(%r8), %r8
	movq -256(%rbp), %r9
	addq $2, %r8
	movq $8, %rax
	imulq %rax, %r8
	addq %r9, %r8
	movq %r10, 0(%r8)
	movq -256(%rbp), %rdi
	movq -264(%rbp), %rsi
	movq -272(%rbp), %rdx
	call def_check
	movq %rax, %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L420
L405:
	incq -288(%rbp)
	jmp L509
L420:
	movq -280(%rbp), %rsi
	movq -304(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -280(%rbp)
	jmp L405
L463:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -360(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -352(%rbp), %r8
	imulq %r9, %r8
	addq -336(%rbp), %r8
	movq %r10, 0(%r8)
	incq -360(%rbp)
	jmp L468
L493:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -400(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -392(%rbp), %r8
	imulq %r9, %r8
	addq -376(%rbp), %r8
	movq %r10, 0(%r8)
	incq -400(%rbp)
	jmp L498
L527:
	movq $1, -432(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -432(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	jmp L400
def_q:
	pushq %rbp
	movq %rsp, %rbp
	addq $-688, %rsp
	movq %rdi, -448(%rbp)
	movq -448(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -512(%rbp)
	movq -512(%rbp), %r15
	movq %r15, -488(%rbp)
	addq $2, -488(%rbp)
	movq $8, %rdi
	imulq -488(%rbp), %rdi
	call malloc
	movq %rax, -472(%rbp)
	movq $4, %r10
	movq -472(%rbp), %r11
	movq %r10, 0(%r11)
	movq -512(%rbp), %r15
	movq -472(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -504(%rbp)
L573:
	movq -504(%rbp), %r15
	movq %r15, -496(%rbp)
	addq $2, -496(%rbp)
	movq -496(%rbp), %r10
	subq -488(%rbp), %r10
	testq %r10, %r10
	jnz L568
	movq -472(%rbp), %r15
	movq %r15, -456(%rbp)
	movq $0, -464(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -464(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -448(%rbp), %rdx
	movq -456(%rbp), %rdi
	call def_count
	movq %rax, %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L568:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -504(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -496(%rbp), %r8
	imulq %r9, %r8
	addq -472(%rbp), %r8
	movq %r10, 0(%r8)
	incq -504(%rbp)
	jmp L573
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
