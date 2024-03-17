	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L180
	cmpq $1, %r10
	jle L184
	cmpq $2, %r10
	jle L186
	cmpq $3, %r10
	jle L202
	cmpq $4, %r10
	jle L228
L178:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L228:
	movq $0, -48(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L225:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L222
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L178
L222:
	movq -48(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	subq -48(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L209
L203:
	incq -48(%rbp)
	jmp L225
L209:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L203
L202:
	movq $0, -32(%rbp)
L201:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L178
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L201
L186:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L178
L184:
	cmpq $0, %rsi
	jle L182
	movq $.LC2, %rdi
L181:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L178
L182:
	movq $.LC3, %rdi
	jmp L181
L180:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L178
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
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
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rsi, -184(%rbp)
	movq %rdi, -176(%rbp)
	movq -176(%rbp), %r15
	movq 0(%r15), %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -200(%rbp)
	movq -184(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -208(%rbp)
	cmpq $0, %r10
	jle L117
	cmpq $1, %r10
	jle L117
	cmpq $2, %r10
	jle L124
	cmpq $3, %r10
	jle L161
	cmpq $4, %r10
	jle L161
L117:
	movq -192(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L161:
	movq -208(%rbp), %r15
	addq -200(%rbp), %r15
	movq %r15, -208(%rbp)
	movq -208(%rbp), %rdi
	call malloc
	movq %rax, %r9
	movq $0, %rax
	addq $2, -176(%rbp)
	addq $2, %r9
L156:
	cmpq %rax, -200(%rbp)
	jle L155
	addq -200(%rbp), %r9
	movq $0, %r10
	addq $2, -184(%rbp)
	addq $2, %r9
L138:
	cmpq %r10, -208(%rbp)
	jl L117
L137:
	movq $8, %rax
	movq %r10, %r8
	imulq %rax, %r8
	addq -184(%rbp), %r8
	movq 0(%r8), %r8
	movq $8, %rcx
	movq %r10, %rax
	imulq %rcx, %rax
	addq %r9, %rax
	movq %r8, 0(%rax)
	incq %r10
	jmp L138
L155:
	movq $8, %r8
	movq %rax, %r10
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %r10
	movq $8, %rcx
	movq %rax, %r8
	imulq %rcx, %r8
	addq %r9, %r8
	movq %r10, 0(%r8)
	incq %rax
	jmp L156
	jmp L161
L124:
	movq -200(%rbp), %r15
	addq -208(%rbp), %r15
	movq %r15, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -200(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -192(%rbp)
	jmp L117
	jmp L117
	jmp L117
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $4, %r10
	movq $0, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $56, %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $5, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 32(%r11)
	movq $4, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 40(%r11)
	movq $5, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 48(%r11)
	movq -56(%rbp), %rdi
	call __print__
	movq %rax, %r10
	movq $4, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -216(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -112(%rbp)
	movq $7, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -136(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -112(%rbp), %rdi
	call def_f
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rsi, -128(%rbp)
	movq %rdi, -120(%rbp)
	movq -120(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq -128(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -168(%rbp)
	setge %r11b
	movzbq %r11b, %r11
	movq %r11, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -168(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L102
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $4, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq -120(%rbp), %r10
	movq %r10, 16(%rsi)
	movq -120(%rbp), %rsi
	movq $1, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -160(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -152(%rbp), %rdi
	call __add__
	movq %rax, %rdi
	movq -128(%rbp), %rsi
	call def_f
	movq %rax, %rsi
	movq -144(%rbp), %rdi
	call __add__
L73:
	movq %rbp, %rsp
	popq %rbp
	ret
L102:
	movq $16, %rdi
	call malloc
	movq $4, %r10
	movq $0, %r8
	movq %r10, 0(%rax)
	movq %r8, 8(%rax)
	jmp L73
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
