	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -608(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdi, -560(%rbp)
	movq -560(%rbp), %r15
	movq 0(%r15), %r10
	movq -560(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L642
	cmpq $1, %r10
	jle L646
	cmpq $2, %r10
	jle L648
	cmpq $3, %r10
	jle L664
	cmpq $4, %r10
	jle L690
L640:
	movq -568(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L690:
	movq $0, -600(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L687:
	movq -560(%rbp), %r15
	movq 8(%r15), %r10
	subq -600(%rbp), %r10
	testq %r10, %r10
	jnz L684
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L640
L684:
	movq -600(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -560(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -560(%rbp), %r15
	movq 8(%r15), %r10
	subq -600(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L671
L665:
	incq -600(%rbp)
	jmp L687
L671:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L665
L664:
	movq $0, -584(%rbp)
L663:
	movq -560(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -592(%rbp)
	movq $2, %r8
	subq -584(%rbp), %r10
	testq %r10, %r10
	jz L640
	movq -584(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -560(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -584(%rbp), %r15
	addq -592(%rbp), %r15
	movq %r15, -584(%rbp)
	jmp L663
L648:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L640
L646:
	cmpq $0, %rsi
	jle L644
	movq $.LC2, %rdi
L643:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L640
L644:
	movq $.LC3, %rdi
	jmp L643
L642:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L640
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -552(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -552(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rsi, -512(%rbp)
	movq %rdi, -504(%rbp)
	movq -504(%rbp), %r15
	movq 0(%r15), %r10
	movq -504(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -528(%rbp)
	movq -512(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -536(%rbp)
	cmpq $0, %r10
	jle L579
	cmpq $1, %r10
	jle L579
	cmpq $2, %r10
	jle L586
	cmpq $3, %r10
	jle L623
	cmpq $4, %r10
	jle L623
L579:
	movq -520(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L623:
	movq -536(%rbp), %r15
	addq -528(%rbp), %r15
	movq %r15, -536(%rbp)
	movq -536(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -504(%rbp)
	addq $2, %r10
L618:
	cmpq %r8, -528(%rbp)
	jle L617
	addq -528(%rbp), %r10
	movq $0, %r8
	addq $2, -512(%rbp)
	addq $2, %r10
L600:
	cmpq %r8, -536(%rbp)
	jl L579
L599:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -512(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L600
L617:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -504(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L618
	jmp L623
L586:
	movq -528(%rbp), %r15
	addq -536(%rbp), %r15
	movq %r15, -528(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -528(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -520(%rbp)
	jmp L579
	jmp L579
	jmp L579
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq $0, -544(%rbp)
L173:
	movq $88, %rdi
	call malloc
	movq %rax, -632(%rbp)
	movq $4, %r10
	movq $9, %r8
	movq -632(%rbp), %r11
	movq %r10, 0(%r11)
	movq -632(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq -632(%rbp), %r11
	movq %r8, 16(%r11)
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -8(%rbp), %r15
	movq %r15, 8(%r8)
	movq -632(%rbp), %r11
	movq %r8, 24(%r11)
	movq $2, -704(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -704(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -696(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -696(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -688(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -688(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -680(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -680(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -672(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -672(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 64(%r11)
	movq $7, -664(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -664(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 72(%r11)
	movq $8, -656(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -656(%rbp), %r15
	movq %r15, 8(%r10)
	movq -632(%rbp), %r11
	movq %r10, 80(%r11)
	movq $88, %rdi
	call malloc
	movq %rax, -48(%rbp)
	movq $4, %r10
	movq $9, %r8
	movq -48(%rbp), %r11
	movq %r10, 0(%r11)
	movq -48(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -648(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -648(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -640(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -640(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -624(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -624(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -616(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -616(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -576(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -576(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -496(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -496(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rax, %r10
	movq -48(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -408(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -408(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 64(%r11)
	movq $7, -312(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -312(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 72(%r11)
	movq $8, -224(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -224(%rbp), %r15
	movq %r15, 8(%r10)
	movq -48(%rbp), %r11
	movq %r10, 80(%r11)
	movq -48(%rbp), %r15
	movq 8(%r15), %r8
	movq -632(%rbp), %r10
	movq -544(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -544(%rbp)
	jl L12
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L12:
	movq $8, %r8
	imulq %r8, %r10
	addq -632(%rbp), %r10
	movq 0(%r10), %rdi
	call def_q
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	incq -544(%rbp)
	jmp L173
def_abs:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdi, -24(%rbp)
	movq -24(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -32(%rbp)
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -32(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L181
	movq -24(%rbp), %rax
L175:
	movq %rbp, %rsp
	popq %rbp
	ret
L181:
	movq -24(%rbp), %r10
	movq 8(%r10), %r10
	movq $0, %rax
	subq %r10, %rax
	jmp L175
def_check:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdx, %r10
	movq %rsi, -64(%rbp)
	movq %rdi, -56(%rbp)
	movq $0, -72(%rbp)
L395:
	movq -64(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -216(%rbp)
	movq -216(%rbp), %r15
	movq %r15, -192(%rbp)
	addq $2, -192(%rbp)
	movq $8, %rdi
	imulq -192(%rbp), %rdi
	call malloc
	movq %rax, -184(%rbp)
	movq $4, %r10
	movq -184(%rbp), %r11
	movq %r10, 0(%r11)
	movq -216(%rbp), %r15
	movq -184(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -208(%rbp)
L384:
	movq -208(%rbp), %r15
	movq %r15, -200(%rbp)
	addq $2, -200(%rbp)
	movq -200(%rbp), %r10
	subq -192(%rbp), %r10
	testq %r10, %r10
	jnz L379
	movq -184(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -64(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -176(%rbp)
	movq -176(%rbp), %r15
	movq %r15, -152(%rbp)
	addq $2, -152(%rbp)
	movq $8, %rdi
	imulq -152(%rbp), %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -176(%rbp), %r15
	movq -144(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -168(%rbp)
L354:
	movq -168(%rbp), %r15
	movq %r15, -160(%rbp)
	addq $2, -160(%rbp)
	movq -160(%rbp), %r10
	subq -152(%rbp), %r10
	testq %r10, %r10
	jnz L349
	movq -144(%rbp), %r10
	movq 8(%r10), %r8
	movq -80(%rbp), %r10
	movq -72(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -72(%rbp)
	jl L330
L212:
	movq $16, %rdi
	call malloc
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rax)
	movq %r10, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
L330:
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %r15
	movq %r15, -88(%rbp)
	movq -64(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -136(%rbp)
	movq -88(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
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
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	testq -96(%rbp), -96(%rbp)
	jz L285
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
L224:
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L221
	incq -72(%rbp)
	jmp L395
L221:
	movq $16, %rdi
	call malloc
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rax)
	movq %r10, 8(%rax)
	jmp L212
L285:
	movq -64(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r15
	movq %r15, -128(%rbp)
	movq -88(%rbp), %r10
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r10
	subq %r10, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -128(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_abs
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -112(%rbp)
	movq -64(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -120(%rbp)
	movq -88(%rbp), %r10
	movq 8(%r10), %r10
	subq %r10, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -120(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_abs
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -112(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -104(%rbp)
	cmpq $0, -104(%rbp)
	setne -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	jmp L224
L349:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -160(%rbp), %r8
	imulq %r9, %r8
	addq -144(%rbp), %r8
	movq %r10, 0(%r8)
	incq -168(%rbp)
	jmp L354
L379:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -200(%rbp), %r8
	imulq %r9, %r8
	addq -184(%rbp), %r8
	movq %r10, 0(%r8)
	incq -208(%rbp)
	jmp L384
def_count:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdx, -248(%rbp)
	movq %rsi, -240(%rbp)
	movq %rdi, -232(%rbp)
	movq -240(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -424(%rbp)
	movq -248(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -424(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -424(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -424(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L522
	movq $0, -400(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -400(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -256(%rbp)
	movq $0, -264(%rbp)
L505:
	movq -248(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -392(%rbp)
	movq -392(%rbp), %r15
	movq %r15, -368(%rbp)
	addq $2, -368(%rbp)
	movq $8, %rdi
	imulq -368(%rbp), %rdi
	call malloc
	movq %rax, -360(%rbp)
	movq $4, %r10
	movq -360(%rbp), %r11
	movq %r10, 0(%r11)
	movq -392(%rbp), %r15
	movq -360(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -384(%rbp)
L494:
	movq -384(%rbp), %r15
	movq %r15, -376(%rbp)
	addq $2, -376(%rbp)
	movq -376(%rbp), %r10
	subq -368(%rbp), %r10
	testq %r10, %r10
	jnz L489
	movq -360(%rbp), %r15
	movq %r15, -272(%rbp)
	movq -248(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -352(%rbp)
	movq -352(%rbp), %r15
	movq %r15, -328(%rbp)
	addq $2, -328(%rbp)
	movq $8, %rdi
	imulq -328(%rbp), %rdi
	call malloc
	movq %rax, -320(%rbp)
	movq $4, %r10
	movq -320(%rbp), %r11
	movq %r10, 0(%r11)
	movq -352(%rbp), %r15
	movq -320(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -344(%rbp)
L464:
	movq -344(%rbp), %r15
	movq %r15, -336(%rbp)
	addq $2, -336(%rbp)
	movq -336(%rbp), %r10
	subq -328(%rbp), %r10
	testq %r10, %r10
	jnz L459
	movq -320(%rbp), %r10
	movq 8(%r10), %r8
	movq -272(%rbp), %r10
	movq -264(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -264(%rbp)
	jl L440
	movq -256(%rbp), %rax
L397:
	movq %rbp, %rsp
	popq %rbp
	ret
L440:
	movq $8, %r8
	imulq %r8, %r10
	addq -272(%rbp), %r10
	movq 0(%r10), %r10
	movq -240(%rbp), %r8
	movq 8(%r8), %r8
	movq -232(%rbp), %r9
	addq $2, %r8
	movq $8, %rax
	imulq %rax, %r8
	addq %r9, %r8
	movq %r10, 0(%r8)
	movq -232(%rbp), %rdi
	movq -240(%rbp), %rsi
	movq -248(%rbp), %rdx
	call def_check
	movq %rax, %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L416
L401:
	incq -264(%rbp)
	jmp L505
L416:
	movq -256(%rbp), %rsi
	movq -232(%rbp), %r15
	movq %r15, -288(%rbp)
	movq -240(%rbp), %rsi
	movq $1, -304(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -304(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -296(%rbp), %rdi
	call __add__
	movq %rax, %rsi
	movq -248(%rbp), %rdx
	movq -288(%rbp), %rdi
	call def_count
	movq %rax, %rsi
	movq -280(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -256(%rbp)
	jmp L401
L459:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -344(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -336(%rbp), %r8
	imulq %r9, %r8
	addq -320(%rbp), %r8
	movq %r10, 0(%r8)
	incq -344(%rbp)
	jmp L464
L489:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -384(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -376(%rbp), %r8
	imulq %r9, %r8
	addq -360(%rbp), %r8
	movq %r10, 0(%r8)
	incq -384(%rbp)
	jmp L494
L522:
	movq $1, -416(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -416(%rbp), %r15
	movq %r15, 8(%rax)
	jmp L397
def_q:
	pushq %rbp
	movq %rsp, %rbp
	addq $-704, %rsp
	movq %rdi, -432(%rbp)
	movq -432(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -488(%rbp)
	movq -488(%rbp), %r15
	movq %r15, -464(%rbp)
	addq $2, -464(%rbp)
	movq $8, %rdi
	imulq -464(%rbp), %rdi
	call malloc
	movq %rax, -456(%rbp)
	movq $4, %r10
	movq -456(%rbp), %r11
	movq %r10, 0(%r11)
	movq -488(%rbp), %r15
	movq -456(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -480(%rbp)
L567:
	movq -480(%rbp), %r15
	movq %r15, -472(%rbp)
	addq $2, -472(%rbp)
	movq -472(%rbp), %r10
	subq -464(%rbp), %r10
	testq %r10, %r10
	jnz L562
	movq -456(%rbp), %r15
	movq %r15, -440(%rbp)
	movq $0, -448(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -448(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -432(%rbp), %rdx
	movq -440(%rbp), %rdi
	call def_count
	movq %rbp, %rsp
	popq %rbp
	ret
L562:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -480(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -472(%rbp), %r8
	imulq %r9, %r8
	addq -456(%rbp), %r8
	movq %r10, 0(%r8)
	incq -480(%rbp)
	jmp L567
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
