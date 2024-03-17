	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L115
	cmpq $1, %r10
	jle L119
	cmpq $2, %r10
	jle L121
	cmpq $3, %r10
	jle L137
	cmpq $4, %r10
	jle L163
L113:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L163:
	movq $0, -128(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L160:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -128(%rbp), %r10
	testq %r10, %r10
	jnz L157
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L113
L157:
	movq -128(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -128(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L144
L138:
	incq -128(%rbp)
	jmp L160
L144:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L138
L137:
	movq $0, -112(%rbp)
L136:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -120(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jz L113
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
	jmp L136
L121:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L113
L119:
	cmpq $0, %rsi
	jle L117
	movq $.LC2, %rdi
L116:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L113
L117:
	movq $.LC3, %rdi
	jmp L116
L115:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L113
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
	movq %rsi, -56(%rbp)
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	cmpq $0, %r10
	jle L52
	cmpq $1, %r10
	jle L52
	cmpq $2, %r10
	jle L59
	cmpq $3, %r10
	jle L96
	cmpq $4, %r10
	jle L96
L52:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L96:
	movq -80(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L91:
	cmpq %r8, -72(%rbp)
	jle L90
	addq -72(%rbp), %r10
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L73:
	cmpq %r8, -80(%rbp)
	jl L52
L72:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -56(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L73
L90:
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
	jmp L91
	jmp L96
L59:
	movq -72(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -72(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -64(%rbp)
	jmp L52
	jmp L52
	jmp L52
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $111, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $222, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 24(%r11)
	movq $333, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 32(%r11)
	movq -16(%rbp), %r15
	movq %r15, -136(%rbp)
	movq $1, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -8(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -136(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq %rax, %r10
	movq $0, %rax
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
