	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-168, %rsp
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %r15
	movq 0(%r15), %r10
	movq -144(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L121
	cmpq $1, %r10
	jle L125
	cmpq $2, %r10
	jle L127
	cmpq $3, %r10
	jle L143
	cmpq $4, %r10
	jle L159
L117:
	movq -152(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L159:
	movq $0, -8(%rbp)
L158:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L153
L119:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L117
L153:
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L158
L143:
	movq $0, -160(%rbp)
L142:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -168(%rbp)
	movq $2, %r8
	subq -160(%rbp), %r10
	testq %r10, %r10
	jz L119
	movq -160(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -160(%rbp), %r15
	addq -168(%rbp), %r15
	movq %r15, -160(%rbp)
	jmp L142
L127:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L119
L125:
	cmpq $0, %rsi
	jle L123
	movq $.LC2, %rdi
L122:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L119
L123:
	movq $.LC3, %rdi
	jmp L122
L121:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L119
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-168, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -136(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-168, %rsp
	movq %rsi, -96(%rbp)
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -112(%rbp)
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -120(%rbp)
	cmpq $0, %r10
	jle L56
	cmpq $1, %r10
	jle L56
	cmpq $2, %r10
	jle L63
	cmpq $3, %r10
	jle L100
	cmpq $4, %r10
	jle L100
L56:
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L100:
	movq -120(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -120(%rbp)
	movq -120(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L95:
	cmpq %r8, -112(%rbp)
	jle L94
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L77:
	cmpq %r8, -120(%rbp)
	jl L56
L76:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -96(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L77
L94:
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
	jmp L95
	jmp L100
L63:
	addq %r8, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -128(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -104(%rbp)
	jmp L56
	jmp L56
	jmp L56
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-168, %rsp
	movq $0, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -24(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_loop
	movq %rax, %r10
	movq 8(%r10), %r10
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
def_loop:
	pushq %rbp
	movq %rsp, %rbp
	addq $-168, %rsp
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %rdi
	call __print__
	movq %rax, -32(%rbp)
	movq -40(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	movq $3, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -64(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L33
L21:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L33:
	movq -40(%rbp), %rsi
	movq -48(%rbp), %rdi
	call __add__
	movq %rax, %rdi
	call def_loop
	movq %rax, %r10
	movq 8(%r10), %r10
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
