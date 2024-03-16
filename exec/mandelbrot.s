	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -808(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rdi, -760(%rbp)
	movq -760(%rbp), %r15
	movq 0(%r15), %r10
	movq -760(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L653
	cmpq $1, %r10
	jle L657
	cmpq $2, %r10
	jle L659
	cmpq $3, %r10
	jle L675
	cmpq $4, %r10
	jle L701
L651:
	movq -768(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L701:
	movq $0, -800(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L698:
	movq -760(%rbp), %r15
	movq 8(%r15), %r10
	subq -800(%rbp), %r10
	testq %r10, %r10
	jnz L695
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L651
L695:
	movq -800(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -760(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -760(%rbp), %r15
	movq 8(%r15), %r10
	subq -800(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L682
L676:
	incq -800(%rbp)
	jmp L698
L682:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L676
L675:
	movq $0, -784(%rbp)
L674:
	movq -760(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -792(%rbp)
	movq $2, %r8
	subq -784(%rbp), %r10
	testq %r10, %r10
	jz L651
	movq -784(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -760(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -784(%rbp), %r15
	addq -792(%rbp), %r15
	movq %r15, -784(%rbp)
	jmp L674
L659:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L651
L657:
	cmpq $0, %rsi
	jle L655
	movq $.LC2, %rdi
L654:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L651
L655:
	movq $.LC3, %rdi
	jmp L654
L653:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L651
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -752(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -752(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rsi, -712(%rbp)
	movq %rdi, -704(%rbp)
	movq -704(%rbp), %r15
	movq 0(%r15), %r10
	movq -704(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -728(%rbp)
	movq -712(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -736(%rbp)
	cmpq $0, %r10
	jle L590
	cmpq $1, %r10
	jle L590
	cmpq $2, %r10
	jle L597
	cmpq $3, %r10
	jle L634
	cmpq $4, %r10
	jle L634
L590:
	movq -720(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L634:
	movq -736(%rbp), %r15
	addq -728(%rbp), %r15
	movq %r15, -736(%rbp)
	movq -736(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -704(%rbp)
	addq $2, %r10
L629:
	cmpq %r8, -728(%rbp)
	jle L628
	movq $0, %r8
	addq $2, -712(%rbp)
	addq $2, %r10
L611:
	cmpq %r8, -736(%rbp)
	jl L590
L610:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -712(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L611
L628:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -704(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L629
	jmp L634
L597:
	movq -728(%rbp), %r15
	addq -736(%rbp), %r15
	movq %r15, -728(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -728(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -720(%rbp)
	jmp L590
	jmp L590
	jmp L590
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	call def_main
	movq %rax, %r10
	movq 8(%r10), %r10
	movq $0, -608(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -608(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_add:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rdi, %rsi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_sub:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rsi, %r8
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -256(%rbp)
	movq 8(%r8), %r10
	subq %r10, -256(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -256(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_mul:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rsi, %r8
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -816(%rbp)
	movq 8(%r8), %r10
	movq -816(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -816(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -816(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -744(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -496(%rbp)
	movq $8192, -648(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -648(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -496(%rbp), %rax
	cqto
	idivq %r10
	movq %rax, -496(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -496(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_div:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rsi, -824(%rbp)
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -864(%rbp)
	movq $8192, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -864(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -864(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -864(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -840(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -832(%rbp)
	movq -824(%rbp), %r10
	movq 8(%r10), %r10
	movq -832(%rbp), %rax
	cqto
	idivq %r10
	movq %rax, -832(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -832(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_of_int:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -16(%rbp)
	movq $8192, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -16(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -16(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_iter:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %r8, -64(%rbp)
	movq %rcx, -56(%rbp)
	movq %rdx, -48(%rbp)
	movq %rsi, -40(%rbp)
	movq %rdi, -32(%rbp)
	movq -32(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -184(%rbp)
	movq $100, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -184(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L232
	movq -56(%rbp), %rdi
	movq -56(%rbp), %rsi
	call def_mul
	movq %rax, %r10
	movq %r10, -128(%rbp)
	movq -64(%rbp), %rdi
	movq -64(%rbp), %rsi
	call def_mul
	movq %rax, %r10
	movq %r10, -120(%rbp)
	movq -128(%rbp), %rdi
	movq -120(%rbp), %rsi
	call def_add
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -160(%rbp)
	movq $4, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -168(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -160(%rbp)
	setg %r11b
	movzbq %r11b, %r11
	movq %r11, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -160(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L192
	movq -32(%rbp), %rsi
	movq -136(%rbp), %rdi
	call __add__
	movq %rax, -96(%rbp)
	movq -40(%rbp), %r15
	movq %r15, -88(%rbp)
	movq -48(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -128(%rbp), %rdi
	movq -120(%rbp), %rsi
	call def_sub
	movq %rax, %rdi
	movq -40(%rbp), %rsi
	call def_add
	movq %rax, -72(%rbp)
	movq $2, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -112(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, -104(%rbp)
	movq -56(%rbp), %rdi
	movq -64(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -104(%rbp), %rdi
	call def_mul
	movq %rax, %rdi
	movq -48(%rbp), %rsi
	call def_add
	movq %rax, %r8
	movq -72(%rbp), %rcx
	movq -80(%rbp), %rdx
	movq -88(%rbp), %rsi
	movq -96(%rbp), %rdi
	call def_iter
	movq %rax, %r10
	movq 8(%r10), %rax
L149:
	movq %rbp, %rsp
	popq %rbp
	ret
L192:
	movq $0, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	jmp L149
L232:
	movq $1, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	jmp L149
def_inside:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq %rsi, -208(%rbp)
	movq %rdi, -200(%rbp)
	movq $0, -272(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -272(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -240(%rbp)
	movq -200(%rbp), %r15
	movq %r15, -232(%rbp)
	movq -208(%rbp), %r15
	movq %r15, -224(%rbp)
	movq $0, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -264(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, -216(%rbp)
	movq $0, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -248(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r8
	movq -216(%rbp), %rcx
	movq -224(%rbp), %rdx
	movq -232(%rbp), %rsi
	movq -240(%rbp), %rdi
	call def_iter
	movq %rax, %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-864, %rsp
	movq $-2, -696(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -696(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -368(%rbp)
	movq $1, -688(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -688(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -672(%rbp)
	movq $40, -680(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -680(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -424(%rbp)
	movq -672(%rbp), %rdi
	movq -368(%rbp), %rsi
	call def_sub
	movq %rax, -640(%rbp)
	movq $2, -664(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -664(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -656(%rbp)
	movq -424(%rbp), %r10
	movq 8(%r10), %r10
	movq -656(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -656(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -656(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %rsi
	movq -640(%rbp), %rdi
	call def_div
	movq %rax, %r10
	movq %r10, -360(%rbp)
	movq $-1, -632(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -632(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -520(%rbp)
	movq $1, -624(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -624(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %rdi
	movq -520(%rbp), %rsi
	call def_sub
	movq %rax, -616(%rbp)
	movq -424(%rbp), %rdi
	call def_of_int
	movq %rax, %rsi
	movq -616(%rbp), %rdi
	call def_div
	movq %rax, %r10
	movq %r10, -512(%rbp)
	movq $0, -288(%rbp)
L514:
	movq -424(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -600(%rbp)
	movq -600(%rbp), %r15
	movq %r15, -576(%rbp)
	addq $2, -576(%rbp)
	movq $8, %rdi
	imulq -576(%rbp), %rdi
	call malloc
	movq %rax, -568(%rbp)
	movq $4, %r10
	movq -568(%rbp), %r11
	movq %r10, 0(%r11)
	movq -600(%rbp), %r15
	movq -568(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -592(%rbp)
L503:
	movq -592(%rbp), %r15
	movq %r15, -584(%rbp)
	addq $2, -584(%rbp)
	movq -584(%rbp), %r10
	subq -576(%rbp), %r10
	testq %r10, %r10
	jnz L498
	movq -568(%rbp), %r15
	movq %r15, -296(%rbp)
	movq -424(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -560(%rbp)
	movq -560(%rbp), %r15
	movq %r15, -536(%rbp)
	addq $2, -536(%rbp)
	movq $8, %rdi
	imulq -536(%rbp), %rdi
	call malloc
	movq %rax, -528(%rbp)
	movq $4, %r10
	movq -528(%rbp), %r11
	movq %r10, 0(%r11)
	movq -560(%rbp), %r15
	movq -528(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -552(%rbp)
L473:
	movq -552(%rbp), %r15
	movq %r15, -544(%rbp)
	addq $2, -544(%rbp)
	movq -544(%rbp), %r10
	subq -536(%rbp), %r10
	testq %r10, %r10
	jnz L468
	movq -528(%rbp), %r10
	movq 8(%r10), %r8
	movq -296(%rbp), %r10
	movq -288(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -288(%rbp)
	jl L449
	movq -280(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L449:
	movq $8, %r8
	imulq %r8, %r10
	addq -296(%rbp), %r10
	movq 0(%r10), %rdi
	movq -520(%rbp), %r15
	movq %r15, -504(%rbp)
	call def_of_int
	movq %rax, %rdi
	movq -512(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -504(%rbp), %rdi
	call def_add
	movq %rax, %r10
	movq %r10, -344(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq %r10, -304(%rbp)
	movq $0, -312(%rbp)
L427:
	movq $2, -488(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -488(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -480(%rbp)
	movq -424(%rbp), %r10
	movq 8(%r10), %r10
	movq -480(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -480(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -480(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -472(%rbp)
	movq -472(%rbp), %r15
	movq %r15, -448(%rbp)
	addq $2, -448(%rbp)
	movq $8, %rdi
	imulq -448(%rbp), %rdi
	call malloc
	movq %rax, -440(%rbp)
	movq $4, %r10
	movq -440(%rbp), %r11
	movq %r10, 0(%r11)
	movq -472(%rbp), %r15
	movq -440(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -464(%rbp)
L400:
	movq -464(%rbp), %r15
	movq %r15, -456(%rbp)
	addq $2, -456(%rbp)
	movq -456(%rbp), %r10
	subq -448(%rbp), %r10
	testq %r10, %r10
	jnz L395
	movq -440(%rbp), %r15
	movq %r15, -320(%rbp)
	movq $2, -432(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -432(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -416(%rbp)
	movq -424(%rbp), %r10
	movq 8(%r10), %r10
	movq -416(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -416(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -416(%rbp), %r15
	movq %r15, 8(%r10)
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
L354:
	movq -400(%rbp), %r15
	movq %r15, -392(%rbp)
	addq $2, -392(%rbp)
	movq -392(%rbp), %r10
	subq -384(%rbp), %r10
	testq %r10, %r10
	jnz L349
	movq -376(%rbp), %r10
	movq 8(%r10), %r8
	movq -320(%rbp), %r10
	movq -312(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -312(%rbp)
	jl L330
	movq -304(%rbp), %rdi
	call __print__
	movq %rax, -280(%rbp)
	incq -288(%rbp)
	jmp L514
L330:
	movq $8, %r8
	imulq %r8, %r10
	addq -320(%rbp), %r10
	movq 0(%r10), %rdi
	movq -368(%rbp), %r15
	movq %r15, -352(%rbp)
	call def_of_int
	movq %rax, %rdi
	movq -360(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -352(%rbp), %rdi
	call def_add
	movq %rax, %rdi
	movq -344(%rbp), %rsi
	call def_inside
	movq %rax, %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L300
	movq -304(%rbp), %rsi
	movq -336(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -304(%rbp)
L288:
	incq -312(%rbp)
	jmp L427
L300:
	movq -304(%rbp), %rsi
	movq -328(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -304(%rbp)
	jmp L288
L349:
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
	jmp L354
L395:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -464(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -456(%rbp), %r8
	imulq %r9, %r8
	addq -440(%rbp), %r8
	movq %r10, 0(%r8)
	incq -464(%rbp)
	jmp L400
L468:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -552(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -544(%rbp), %r8
	imulq %r9, %r8
	addq -528(%rbp), %r8
	movq %r10, 0(%r8)
	incq -552(%rbp)
	jmp L473
L498:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -592(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -584(%rbp), %r8
	imulq %r9, %r8
	addq -568(%rbp), %r8
	movq %r10, 0(%r8)
	incq -592(%rbp)
	jmp L503
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
