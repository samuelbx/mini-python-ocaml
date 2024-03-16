	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	call def_foo
	movq %rax, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L117
	cmpq $1, %r10
	jle L121
	cmpq $2, %r10
	jle L123
	cmpq $3, %r10
	jle L139
L113:
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -96(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -96(%rbp)
	movq -96(%rbp), %r15
	movq %r15, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L66
	cmpq $1, %r10
	jle L70
	cmpq $2, %r10
	jle L72
	cmpq $3, %r10
	jle L88
L62:
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -48(%rbp)
	setne %r11b
	movzbq %r11b, %r11
	movq %r11, -48(%rbp)
	movq -48(%rbp), %r15
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
	movq $0, -16(%rbp)
L36:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -24(%rbp)
	movq $2, %r8
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
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
L88:
	movq $0, -64(%rbp)
L87:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L82
L64:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L62
L82:
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L87
L72:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L64
L70:
	cmpq $0, %rsi
	jle L68
	movq $.LC2, %rdi
L67:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L64
L68:
	movq $.LC3, %rdi
	jmp L67
L66:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L64
L139:
	movq $0, -112(%rbp)
L138:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L133
L115:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L113
L133:
	movq -112(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L138
L123:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L115
L121:
	cmpq $0, %rsi
	jle L119
	movq $.LC2, %rdi
L118:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L115
L119:
	movq $.LC3, %rdi
	jmp L118
L117:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L115
def_foo:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -144(%rbp), %rax
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
