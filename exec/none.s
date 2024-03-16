	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L113
	cmpq $1, %r10
	jle L117
	cmpq $2, %r10
	jle L119
	cmpq $3, %r10
	jle L135
	cmpq $4, %r10
	jle L151
L109:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L151:
	movq $0, -136(%rbp)
L150:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L145
L111:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L109
L145:
	movq -136(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -136(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -136(%rbp)
	jmp L150
L135:
	movq $0, -120(%rbp)
L134:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -128(%rbp)
	movq $2, %r8
	subq -120(%rbp), %r10
	testq %r10, %r10
	jz L111
	movq -120(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -120(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -120(%rbp)
	jmp L134
L119:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L111
L117:
	cmpq $0, %rsi
	jle L115
	movq $.LC2, %rdi
L114:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L111
L115:
	movq $.LC3, %rdi
	jmp L114
L113:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L111
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -96(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rsi, -48(%rbp)
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	cmpq $0, %r10
	jle L48
	cmpq $1, %r10
	jle L48
	cmpq $2, %r10
	jle L55
	cmpq $3, %r10
	jle L92
	cmpq $4, %r10
	jle L92
L48:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L92:
	movq -80(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L87:
	cmpq %r8, -72(%rbp)
	jle L86
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L69:
	cmpq %r8, -80(%rbp)
	jl L48
L68:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -48(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L69
L86:
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
	jmp L87
	jmp L92
L55:
	addq %r8, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -88(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -56(%rbp)
	jmp L48
	jmp L48
	jmp L48
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	call def_foo
	movq %rax, %rdi
	call __print__
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -16(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -16(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r10
	movq %r10, 0(%rdi)
	movq -16(%rbp), %r15
	movq %r15, 8(%rdi)
	call __print__
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	call def_foo
	movq %rax, %r10
	movq 8(%r10), %r10
	cmpq %r10, -8(%rbp)
	setne %r11b
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
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_foo:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -24(%rbp), %rax
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
