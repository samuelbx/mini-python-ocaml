	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -784(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rdi, -744(%rbp)
	movq -744(%rbp), %r15
	movq 0(%r15), %r10
	movq -744(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L634
	cmpq $1, %r10
	jle L638
	cmpq $2, %r10
	jle L640
	cmpq $3, %r10
	jle L656
	cmpq $4, %r10
	jle L682
L632:
	movq -752(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L682:
	movq $0, -776(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L679:
	movq -744(%rbp), %r15
	movq 8(%r15), %r10
	subq -776(%rbp), %r10
	testq %r10, %r10
	jnz L676
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L632
L676:
	movq -776(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -744(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -744(%rbp), %r15
	movq 8(%r15), %r10
	subq -776(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L663
L657:
	incq -776(%rbp)
	jmp L679
L663:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L657
L656:
	movq $0, -760(%rbp)
L655:
	movq -744(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -768(%rbp)
	movq $2, %r8
	subq -760(%rbp), %r10
	testq %r10, %r10
	jz L632
	movq -760(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -744(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -760(%rbp), %r15
	addq -768(%rbp), %r15
	movq %r15, -760(%rbp)
	jmp L655
L640:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L632
L638:
	cmpq $0, %rsi
	jle L636
	movq $.LC2, %rdi
L635:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L632
L636:
	movq $.LC3, %rdi
	jmp L635
L634:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L632
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -736(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -736(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, -696(%rbp)
	movq %rdi, -688(%rbp)
	movq -688(%rbp), %r15
	movq 0(%r15), %r10
	movq -688(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -712(%rbp)
	movq -696(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -720(%rbp)
	cmpq $0, %r10
	jle L571
	cmpq $1, %r10
	jle L571
	cmpq $2, %r10
	jle L578
	cmpq $3, %r10
	jle L615
	cmpq $4, %r10
	jle L615
L571:
	movq -704(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L615:
	movq -720(%rbp), %r15
	addq -712(%rbp), %r15
	movq %r15, -720(%rbp)
	movq -720(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -688(%rbp)
	addq $2, %r10
L610:
	cmpq %r8, -712(%rbp)
	jle L609
	addq -712(%rbp), %r10
	movq $0, %r8
	addq $2, -696(%rbp)
	addq $2, %r10
L592:
	cmpq %r8, -720(%rbp)
	jl L571
L591:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -696(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L592
L609:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -688(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L610
	jmp L615
L578:
	movq -712(%rbp), %r15
	addq -720(%rbp), %r15
	movq %r15, -712(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -712(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -704(%rbp)
	jmp L571
	jmp L571
	jmp L571
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	call def_main
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_add:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, %r10
	movq %rdi, %rsi
	movq %r10, %rsi
	call __add__
	movq %rbp, %rsp
	popq %rbp
	ret
def_sub:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, %r8
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -112(%rbp)
	movq 8(%r8), %r10
	subq %r10, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -112(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
def_mul:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, %r8
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -728(%rbp)
	movq 8(%r8), %r10
	movq -728(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -728(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -728(%rbp), %r15
	movq %r15, 8(%rsi)
	movq $4096, -616(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -616(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -592(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -328(%rbp)
	movq $8192, -472(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -472(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -328(%rbp), %rax
	cqto
	idivq %r10
	movq %rax, -328(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -328(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
def_div:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, -792(%rbp)
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -832(%rbp)
	movq $8192, -840(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -840(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -832(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -832(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -832(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -792(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -816(%rbp)
	movq $2, -824(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -824(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -816(%rbp), %rax
	cqto
	idivq %r10
	movq %rax, -816(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -816(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -808(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -800(%rbp)
	movq -792(%rbp), %r10
	movq 8(%r10), %r10
	movq -800(%rbp), %rax
	cqto
	idivq %r10
	movq %rax, -800(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -800(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
def_of_int:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -848(%rbp)
	movq $8192, -856(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -856(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq -848(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -848(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -848(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
def_iter:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %r8, -40(%rbp)
	movq %rcx, -32(%rbp)
	movq %rdx, -24(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq $100, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
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
	jnz L214
	movq -32(%rbp), %rdi
	movq -32(%rbp), %rsi
	call def_mul
	movq %rax, %r10
	movq %r10, -104(%rbp)
	movq -40(%rbp), %rdi
	movq -40(%rbp), %rsi
	call def_mul
	movq %rax, %r10
	movq %r10, -96(%rbp)
	movq -104(%rbp), %rdi
	movq -96(%rbp), %rsi
	call def_add
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -144(%rbp)
	movq $4, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -152(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -144(%rbp)
	setg %r11b
	movzbq %r11b, %r11
	movq %r11, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L175
	movq -8(%rbp), %rsi
	movq $1, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -128(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -120(%rbp), %rdi
	call __add__
	movq %rax, -72(%rbp)
	movq -16(%rbp), %r15
	movq %r15, -64(%rbp)
	movq -24(%rbp), %r15
	movq %r15, -56(%rbp)
	movq -104(%rbp), %rdi
	movq -96(%rbp), %rsi
	call def_sub
	movq %rax, %rdi
	movq -16(%rbp), %rsi
	call def_add
	movq %rax, -48(%rbp)
	movq $2, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -88(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, -80(%rbp)
	movq -32(%rbp), %rdi
	movq -40(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -80(%rbp), %rdi
	call def_mul
	movq %rax, %rdi
	movq -24(%rbp), %rsi
	call def_add
	movq %rax, %r8
	movq -48(%rbp), %rcx
	movq -56(%rbp), %rdx
	movq -64(%rbp), %rsi
	movq -72(%rbp), %rdi
	call def_iter
L134:
	movq %rbp, %rsp
	popq %rbp
	ret
L175:
	movq $0, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -136(%rbp), %r15
	movq %r15, 8(%rax)
	jmp L134
L214:
	movq $1, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -160(%rbp), %r15
	movq %r15, 8(%rax)
	jmp L134
def_inside:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq %rsi, -192(%rbp)
	movq %rdi, -184(%rbp)
	movq $0, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -248(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -224(%rbp)
	movq -184(%rbp), %r15
	movq %r15, -216(%rbp)
	movq -192(%rbp), %r15
	movq %r15, -208(%rbp)
	movq $0, -240(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -240(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, -200(%rbp)
	movq $0, -232(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -232(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r8
	movq -200(%rbp), %rcx
	movq -208(%rbp), %rdx
	movq -216(%rbp), %rsi
	movq -224(%rbp), %rdi
	call def_iter
	movq %rbp, %rsp
	popq %rbp
	ret
def_main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-856, %rsp
	movq $-2, -680(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -680(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -352(%rbp)
	movq $1, -672(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -672(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -656(%rbp)
	movq $40, -664(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -664(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -408(%rbp)
	movq -656(%rbp), %rdi
	movq -352(%rbp), %rsi
	call def_sub
	movq %rax, -632(%rbp)
	movq $2, -648(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -648(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -640(%rbp)
	movq -408(%rbp), %r10
	movq 8(%r10), %r10
	movq -640(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -640(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -640(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %rsi
	movq -632(%rbp), %rdi
	call def_div
	movq %rax, %r10
	movq %r10, -344(%rbp)
	movq $-1, -624(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -624(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %r10
	movq %r10, -504(%rbp)
	movq $1, -608(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -608(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_of_int
	movq %rax, %rdi
	movq -504(%rbp), %rsi
	call def_sub
	movq %rax, -600(%rbp)
	movq -408(%rbp), %rdi
	call def_of_int
	movq %rax, %rsi
	movq -600(%rbp), %rdi
	call def_div
	movq %rax, %r10
	movq %r10, -496(%rbp)
	movq $0, -264(%rbp)
L495:
	movq -408(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -584(%rbp)
	movq -584(%rbp), %r15
	movq %r15, -560(%rbp)
	addq $2, -560(%rbp)
	movq $8, %rdi
	imulq -560(%rbp), %rdi
	call malloc
	movq %rax, -552(%rbp)
	movq $4, %r10
	movq -552(%rbp), %r11
	movq %r10, 0(%r11)
	movq -584(%rbp), %r15
	movq -552(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -576(%rbp)
L484:
	movq -576(%rbp), %r15
	movq %r15, -568(%rbp)
	addq $2, -568(%rbp)
	movq -568(%rbp), %r10
	subq -560(%rbp), %r10
	testq %r10, %r10
	jnz L479
	movq -552(%rbp), %r15
	movq %r15, -272(%rbp)
	movq -408(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -544(%rbp)
	movq -544(%rbp), %r15
	movq %r15, -520(%rbp)
	addq $2, -520(%rbp)
	movq $8, %rdi
	imulq -520(%rbp), %rdi
	call malloc
	movq %rax, -512(%rbp)
	movq $4, %r10
	movq -512(%rbp), %r11
	movq %r10, 0(%r11)
	movq -544(%rbp), %r15
	movq -512(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -536(%rbp)
L454:
	movq -536(%rbp), %r15
	movq %r15, -528(%rbp)
	addq $2, -528(%rbp)
	movq -528(%rbp), %r10
	subq -520(%rbp), %r10
	testq %r10, %r10
	jnz L449
	movq -512(%rbp), %r10
	movq 8(%r10), %r8
	movq -272(%rbp), %r10
	movq -264(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -264(%rbp)
	jl L430
	movq -256(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L430:
	movq $8, %r8
	imulq %r8, %r10
	addq -272(%rbp), %r10
	movq 0(%r10), %rdi
	movq -504(%rbp), %r15
	movq %r15, -488(%rbp)
	call def_of_int
	movq %rax, %rdi
	movq -496(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -488(%rbp), %rdi
	call def_add
	movq %rax, %r10
	movq %r10, -320(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq %r10, -280(%rbp)
	movq $0, -288(%rbp)
L408:
	movq $2, -480(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -480(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -464(%rbp)
	movq -408(%rbp), %r10
	movq 8(%r10), %r10
	movq -464(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -464(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -464(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -456(%rbp)
	movq -456(%rbp), %r15
	movq %r15, -432(%rbp)
	addq $2, -432(%rbp)
	movq $8, %rdi
	imulq -432(%rbp), %rdi
	call malloc
	movq %rax, -424(%rbp)
	movq $4, %r10
	movq -424(%rbp), %r11
	movq %r10, 0(%r11)
	movq -456(%rbp), %r15
	movq -424(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -448(%rbp)
L381:
	movq -448(%rbp), %r15
	movq %r15, -440(%rbp)
	addq $2, -440(%rbp)
	movq -440(%rbp), %r10
	subq -432(%rbp), %r10
	testq %r10, %r10
	jnz L376
	movq -424(%rbp), %r15
	movq %r15, -296(%rbp)
	movq $2, -416(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -416(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -400(%rbp)
	movq -408(%rbp), %r10
	movq 8(%r10), %r10
	movq -400(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -400(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -400(%rbp), %r15
	movq %r15, 8(%r10)
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
L335:
	movq -384(%rbp), %r15
	movq %r15, -376(%rbp)
	addq $2, -376(%rbp)
	movq -376(%rbp), %r10
	subq -368(%rbp), %r10
	testq %r10, %r10
	jnz L330
	movq -360(%rbp), %r10
	movq 8(%r10), %r8
	movq -296(%rbp), %r10
	movq -288(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -288(%rbp)
	jl L311
	movq -280(%rbp), %rdi
	call __print__
	movq %rax, -256(%rbp)
	incq -264(%rbp)
	jmp L495
L311:
	movq $8, %r8
	imulq %r8, %r10
	addq -296(%rbp), %r10
	movq 0(%r10), %rdi
	movq -352(%rbp), %r15
	movq %r15, -336(%rbp)
	call def_of_int
	movq %rax, %rdi
	movq -344(%rbp), %rsi
	call def_mul
	movq %rax, %rsi
	movq -336(%rbp), %rdi
	call def_add
	movq %rax, %rdi
	movq -320(%rbp), %rsi
	call def_inside
	movq %rax, %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L281
	movq -280(%rbp), %rsi
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $3, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq $49, %r10
	movq %r10, 16(%rsi)
	movq -312(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -280(%rbp)
L269:
	incq -288(%rbp)
	jmp L408
L281:
	movq -280(%rbp), %rsi
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $3, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq $48, %r10
	movq %r10, 16(%rsi)
	movq -304(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq %r10, -280(%rbp)
	jmp L269
L330:
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
	jmp L335
L376:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -448(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -440(%rbp), %r8
	imulq %r9, %r8
	addq -424(%rbp), %r8
	movq %r10, 0(%r8)
	incq -448(%rbp)
	jmp L381
L449:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -536(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -528(%rbp), %r8
	imulq %r9, %r8
	addq -512(%rbp), %r8
	movq %r10, 0(%r8)
	incq -536(%rbp)
	jmp L454
L479:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -576(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -568(%rbp), %r8
	imulq %r9, %r8
	addq -552(%rbp), %r8
	movq %r10, 0(%r8)
	incq -576(%rbp)
	jmp L484
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
