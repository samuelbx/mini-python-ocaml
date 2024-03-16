	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-224, %rsp
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L193
	cmpq $1, %r10
	jle L197
	cmpq $2, %r10
	jle L199
	cmpq $3, %r10
	jle L215
	cmpq $4, %r10
	jle L231
L189:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L231:
	movq $0, -80(%rbp)
L230:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jnz L225
L191:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L189
L225:
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L230
L215:
	movq $0, -64(%rbp)
L214:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jz L191
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L214
L199:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L191
L197:
	cmpq $0, %rsi
	jle L195
	movq $.LC2, %rdi
L194:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L191
L195:
	movq $.LC3, %rdi
	jmp L194
L193:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L191
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-224, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -40(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-224, %rsp
	movq %rsi, -208(%rbp)
	movq %rdi, -200(%rbp)
	movq -200(%rbp), %r15
	movq 0(%r15), %r8
	movq -200(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -224(%rbp)
	movq -208(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -8(%rbp)
	cmpq $0, %r8
	jle L128
	cmpq $1, %r8
	jle L128
	cmpq $2, %r8
	jle L135
	cmpq $3, %r8
	jle L172
	cmpq $4, %r8
	jle L172
L128:
	movq -216(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L172:
	movq -8(%rbp), %r15
	addq -224(%rbp), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -200(%rbp)
	addq $2, %r10
L167:
	cmpq %r8, -224(%rbp)
	jle L166
	movq $0, %r8
	addq $2, -208(%rbp)
	addq $2, %r10
L149:
	cmpq %r8, -8(%rbp)
	jl L128
L148:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -208(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L149
L166:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -200(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L167
	jmp L172
L135:
	addq %r10, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -16(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -216(%rbp)
	jmp L128
	jmp L128
	jmp L128
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-224, %rsp
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
	movq %rax, -104(%rbp)
	movq $4, %r10
	movq $5, %r8
	movq -104(%rbp), %r11
	movq %r10, 0(%r11)
	movq -104(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 32(%r11)
	movq $4, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 40(%r11)
	movq $5, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 48(%r11)
	movq -104(%rbp), %rdi
	call __print__
	movq $4, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -96(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -24(%rbp)
	movq $7, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -32(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -24(%rbp), %rdi
	call def_f
	movq %rax, %rdi
	call __print__
	movq $0, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-224, %rsp
	movq %rsi, -168(%rbp)
	movq %rdi, -160(%rbp)
	movq -160(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -192(%rbp)
	movq -168(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -192(%rbp)
	setge %r11b
	movzbq %r11b, %r11
	movq %r11, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -192(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L113
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $4, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq -160(%rbp), %r10
	movq %r10, 16(%rsi)
	movq -176(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %rax
L82:
	movq %rbp, %rsp
	popq %rbp
	ret
L113:
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
