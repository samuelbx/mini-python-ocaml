	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L156
	cmpq $1, %r10
	jle L160
	cmpq $2, %r10
	jle L162
	cmpq $3, %r10
	jle L178
	cmpq $4, %r10
	jle L194
L152:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L194:
	movq $0, -64(%rbp)
L193:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L188
L154:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L152
L188:
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L193
L178:
	movq $0, -48(%rbp)
L177:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jz L154
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L177
L162:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
L160:
	cmpq $0, %rsi
	jle L158
	movq $.LC2, %rdi
L157:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
L158:
	movq $.LC3, %rdi
	jmp L157
L156:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -8(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $4, %r10
	movq $0, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	call __print__
	movq $56, %rdi
	call malloc
	movq %rax, -88(%rbp)
	movq $4, %r10
	movq $5, %r8
	movq -88(%rbp), %r11
	movq %r10, 0(%r11)
	movq -88(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 32(%r11)
	movq $4, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 40(%r11)
	movq $5, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 48(%r11)
	movq -88(%rbp), %rdi
	call __print__
	movq $4, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -16(%rbp)
	movq $7, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -40(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -16(%rbp), %rdi
	call def_f
	movq %rax, %rdi
	call __print__
	movq $0, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rsi, -152(%rbp)
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -184(%rbp)
	movq -152(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -184(%rbp)
	setge %r11b
	movzbq %r11b, %r11
	movq %r11, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $1, %r10
	movq %r10, 0(%r8)
	movq -184(%rbp), %r15
	movq %r15, 8(%r8)
	movq 8(%r8), %r10
	testq %r10, %r10
	jnz L129
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -144(%rbp), %r8
	movq %r8, 16(%r10)
	movq 8(%r10), %r15
	movq %r15, -160(%rbp)
	movq -144(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq $1, -176(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -176(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	addq %r10, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -168(%rbp), %r15
	movq %r15, 8(%rdi)
	movq -152(%rbp), %rsi
	call def_f
	movq %rax, %r10
	movq 8(%r10), %r10
	addq %r10, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -160(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
L82:
	movq %rbp, %rsp
	popq %rbp
	ret
L129:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %rax
	jmp L82
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
