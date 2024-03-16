	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, -136(%rbp)
	movq -136(%rbp), %r15
	movq 0(%r15), %r10
	movq -136(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L126
	cmpq $1, %r10
	jle L130
	cmpq $2, %r10
	jle L132
	cmpq $3, %r10
	jle L148
	cmpq $4, %r10
	jle L164
L122:
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L164:
	movq $0, -8(%rbp)
L163:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L158
L124:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L122
L158:
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -136(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L163
L148:
	movq $0, -152(%rbp)
L147:
	movq -136(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -160(%rbp)
	movq $2, %r8
	subq -152(%rbp), %r10
	testq %r10, %r10
	jz L124
	movq -152(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -136(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -152(%rbp), %r15
	addq -160(%rbp), %r15
	movq %r15, -152(%rbp)
	jmp L147
L132:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L124
L130:
	cmpq $0, %rsi
	jle L128
	movq $.LC2, %rdi
L127:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L124
L128:
	movq $.LC3, %rdi
	jmp L127
L126:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L124
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -128(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rsi, -88(%rbp)
	movq %rdi, -80(%rbp)
	movq -80(%rbp), %r15
	movq 0(%r15), %r10
	movq -80(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -104(%rbp)
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
	cmpq $0, %r10
	jle L61
	cmpq $1, %r10
	jle L61
	cmpq $2, %r10
	jle L68
	cmpq $3, %r10
	jle L105
	cmpq $4, %r10
	jle L105
L61:
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L105:
	movq -112(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -112(%rbp)
	movq -112(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -80(%rbp)
	addq $2, %r10
L100:
	cmpq %r8, -104(%rbp)
	jle L99
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L82:
	cmpq %r8, -112(%rbp)
	jl L61
L81:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -88(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L82
L99:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -80(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L100
	jmp L105
L68:
	addq %r8, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -120(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -96(%rbp)
	jmp L61
	jmp L61
	jmp L61
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -40(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -40(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r11
	movq %r8, 8(%r11)
	movq $111, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 16(%r11)
	movq $222, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 24(%r11)
	movq $333, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -40(%rbp), %r11
	movq %r10, 32(%r11)
	movq -40(%rbp), %r15
	movq %r15, -24(%rbp)
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -24(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq $0, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
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
