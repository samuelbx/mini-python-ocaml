	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L101
	cmpq $1, %r10
	jle L105
	cmpq $2, %r10
	jle L107
	cmpq $3, %r10
	jle L123
	cmpq $4, %r10
	jle L139
L97:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L139:
	movq $0, -112(%rbp)
L138:
	movq -80(%rbp), %r15
	movq 8(%r15), %r8
	movq $1, -120(%rbp)
	movq $2, %r10
	subq -112(%rbp), %r8
	testq %r8, %r8
	jnz L133
L99:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L97
L133:
	movq -112(%rbp), %r8
	addq %r10, %r8
	movq $8, %r10
	imulq %r10, %r8
	addq -80(%rbp), %r8
	movq 0(%r8), %rdi
	call __print__
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L138
L123:
	movq $0, -96(%rbp)
L122:
	movq -80(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jz L99
	movq -96(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -80(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -96(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -96(%rbp)
	jmp L122
L107:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L99
L105:
	cmpq $0, %rsi
	jle L103
	movq $.LC2, %rdi
L102:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L99
L103:
	movq $.LC3, %rdi
	jmp L102
L101:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L99
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -72(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq $3, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_make
	movq %rax, %rdi
	call __print__
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_make:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -56(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L31
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq $97, %r8
	movq %r8, 16(%r10)
	movq 8(%r10), %r15
	movq %r15, -24(%rbp)
	movq -16(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -32(%rbp)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	subq %r10, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -32(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_make
	movq %rax, %r10
	movq 8(%r10), %r10
	addq %r10, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
L21:
	movq %rbp, %rsp
	popq %rbp
	ret
L31:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %rax
	jmp L21
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
