	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L102
	cmpq $1, %r10
	jle L106
	cmpq $2, %r10
	jle L108
	cmpq $3, %r10
	jle L124
	cmpq $4, %r10
	jle L150
L100:
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L150:
	movq $0, -120(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L147:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -120(%rbp), %r10
	testq %r10, %r10
	jnz L144
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L100
L144:
	movq -120(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -120(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L131
L125:
	incq -120(%rbp)
	jmp L147
L131:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L125
L124:
	movq $0, -104(%rbp)
L123:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -112(%rbp)
	movq $2, %r8
	subq -104(%rbp), %r10
	testq %r10, %r10
	jz L100
	movq -104(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -104(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -104(%rbp)
	jmp L123
L108:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L100
L106:
	cmpq $0, %rsi
	jle L104
	movq $.LC2, %rdi
L103:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L100
L104:
	movq $.LC3, %rdi
	jmp L103
L102:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L100
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -80(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq %rsi, -40(%rbp)
	movq %rdi, -32(%rbp)
	movq -32(%rbp), %r15
	movq 0(%r15), %r10
	movq -32(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	cmpq $0, %r10
	jle L39
	cmpq $1, %r10
	jle L39
	cmpq $2, %r10
	jle L46
	cmpq $3, %r10
	jle L83
	cmpq $4, %r10
	jle L83
L39:
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L83:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -32(%rbp)
	addq $2, %r10
L78:
	cmpq %r8, -64(%rbp)
	jle L77
	addq -64(%rbp), %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L60:
	cmpq %r8, -72(%rbp)
	jl L39
L59:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -40(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L60
L77:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -32(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L78
	jmp L83
L46:
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -48(%rbp)
	jmp L39
	jmp L39
	jmp L39
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	call def_foo
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -8(%rbp)
	sete %r11b
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
	movq %rax, %r10
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -56(%rbp)
	setne %r11b
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
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_foo:
	pushq %rbp
	movq %rsp, %rbp
	addq $-128, %rsp
	movq $1, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %rax
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
