	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L108
	cmpq $1, %r10
	jle L112
	cmpq $2, %r10
	jle L114
	cmpq $3, %r10
	jle L130
	cmpq $4, %r10
	jle L146
L104:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L146:
	movq $0, -128(%rbp)
L145:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jnz L140
L106:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L104
L140:
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L145
L130:
	movq $0, -112(%rbp)
L129:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jz L106
	movq -112(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L129
L114:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L106
L112:
	cmpq $0, %rsi
	jle L110
	movq $.LC2, %rdi
L109:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L106
L110:
	movq $.LC3, %rdi
	jmp L109
L108:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L106
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -88(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rsi, -40(%rbp)
	movq %rdi, -32(%rbp)
	movq -32(%rbp), %r15
	movq 0(%r15), %r10
	movq -32(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -56(%rbp)
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	cmpq $0, %r10
	jle L43
	cmpq $1, %r10
	jle L43
	cmpq $2, %r10
	jle L50
	cmpq $3, %r10
	jle L87
	cmpq $4, %r10
	jle L87
L43:
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L87:
	movq -64(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -64(%rbp)
	movq -64(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -32(%rbp)
	addq $2, %r10
L82:
	cmpq %r8, -56(%rbp)
	jle L81
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L64:
	cmpq %r8, -64(%rbp)
	jl L43
L63:
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
	jmp L64
L81:
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
	jmp L82
	jmp L87
L50:
	addq %r8, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -72(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -48(%rbp)
	jmp L43
	jmp L43
	jmp L43
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -144(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -16(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 32(%r11)
	movq -144(%rbp), %rdi
	call __print__
	movq $0, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
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
