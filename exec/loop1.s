	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -152(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
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
	jle L156
L106:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L156:
	movq $0, -136(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L153:
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L150
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L106
L150:
	movq -136(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -96(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L137
L131:
	incq -136(%rbp)
	jmp L153
L137:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L131
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
	addq $-152, %rsp
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
	addq $-152, %rsp
	movq %rsi, -48(%rbp)
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	cmpq $0, %r10
	jle L45
	cmpq $1, %r10
	jle L45
	cmpq $2, %r10
	jle L52
	cmpq $3, %r10
	jle L89
	cmpq $4, %r10
	jle L89
L45:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L89:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L84:
	cmpq %r8, -64(%rbp)
	jle L83
	addq -64(%rbp), %r10
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L66:
	cmpq %r8, -72(%rbp)
	jl L45
L65:
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
	jmp L66
L83:
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
	jmp L84
	jmp L89
L52:
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
	movq %r8, -56(%rbp)
	jmp L45
	jmp L45
	jmp L45
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $0, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -80(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_loop
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_loop:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %rdi
	call __print__
	movq %rax, -128(%rbp)
	movq -144(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -24(%rbp)
	movq $3, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -24(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L22
L11:
	movq -128(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L22:
	movq -144(%rbp), %rsi
	movq $1, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -16(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -8(%rbp), %rdi
	call __add__
	movq %rax, %rdi
	call def_loop
	movq %rax, %r10
	jmp L11
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
