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
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L133
	cmpq $1, %r10
	jle L137
	cmpq $2, %r10
	jle L139
	cmpq $3, %r10
	jle L155
	cmpq $4, %r10
	jle L181
L131:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L181:
	movq $0, -152(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L178:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -152(%rbp), %r10
	testq %r10, %r10
	jnz L175
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L131
L175:
	movq -152(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -152(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L162
L156:
	incq -152(%rbp)
	jmp L178
L162:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L156
L155:
	movq $0, -128(%rbp)
L154:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L131
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L154
L139:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L131
L137:
	cmpq $0, %rsi
	jle L135
	movq $.LC2, %rdi
L134:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L131
L135:
	movq $.LC3, %rdi
	jmp L134
L133:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L131
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -104(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rsi, -72(%rbp)
	movq %rdi, -64(%rbp)
	movq -64(%rbp), %r15
	movq 0(%r15), %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -88(%rbp)
	movq -72(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -96(%rbp)
	cmpq $0, %r10
	jle L70
	cmpq $1, %r10
	jle L70
	cmpq $2, %r10
	jle L77
	cmpq $3, %r10
	jle L114
	cmpq $4, %r10
	jle L114
L70:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L114:
	movq -96(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -96(%rbp)
	movq -96(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -64(%rbp)
	addq $2, %r10
L109:
	cmpq %r8, -88(%rbp)
	jle L108
	addq -88(%rbp), %r10
	movq $0, %r8
	addq $2, -72(%rbp)
	addq $2, %r10
L91:
	cmpq %r8, -96(%rbp)
	jl L70
L90:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -72(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L91
L108:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -64(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L109
	jmp L114
L77:
	movq -88(%rbp), %r15
	addq -96(%rbp), %r15
	movq %r15, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -88(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -80(%rbp)
	jmp L70
	jmp L70
	jmp L70
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $3, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -48(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_make
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_make:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -136(%rbp)
	movq -136(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq $0, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -40(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L21
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $3, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq $97, %r10
	movq %r10, 16(%rsi)
	movq -136(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -24(%rbp)
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	subq %r10, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -24(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_make
	movq %rax, %rsi
	movq -16(%rbp), %rdi
	call __add__
L12:
	movq %rbp, %rsp
	popq %rbp
	ret
L21:
	movq $16, %rdi
	call malloc
	movq $3, %r10
	movq $0, %r8
	movq %r10, 0(%rax)
	movq %r8, 8(%rax)
	jmp L12
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
