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
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L191
	cmpq $1, %r10
	jle L195
	cmpq $2, %r10
	jle L197
	cmpq $3, %r10
	jle L213
	cmpq $4, %r10
	jle L239
L189:
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L239:
	movq $0, -72(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L236:
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	subq -72(%rbp), %r10
	testq %r10, %r10
	jnz L233
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L189
L233:
	movq -72(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -40(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	subq -72(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L220
L214:
	incq -72(%rbp)
	jmp L236
L220:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L214
L213:
	movq $0, -56(%rbp)
L212:
	movq -40(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jz L189
	movq -56(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -40(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	jmp L212
L197:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L189
L195:
	cmpq $0, %rsi
	jle L193
	movq $.LC2, %rdi
L192:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L189
L193:
	movq $.LC3, %rdi
	jmp L192
L191:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L189
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -32(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rsi, -200(%rbp)
	movq %rdi, -192(%rbp)
	movq -192(%rbp), %r15
	movq 0(%r15), %r10
	movq -192(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -216(%rbp)
	movq -200(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -8(%rbp)
	cmpq $0, %r10
	jle L128
	cmpq $1, %r10
	jle L128
	cmpq $2, %r10
	jle L135
	cmpq $3, %r10
	jle L172
	cmpq $4, %r10
	jle L172
L128:
	movq -208(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L172:
	movq -8(%rbp), %r15
	addq -216(%rbp), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -192(%rbp)
	addq $2, %r10
L167:
	cmpq %r8, -216(%rbp)
	jle L166
	movq $0, %r8
	addq $2, -200(%rbp)
	addq $2, %r10
L149:
	cmpq %r8, -8(%rbp)
	jl L128
L148:
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
	jmp L149
L166:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -192(%rbp), %r9
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
	movq -216(%rbp), %r15
	addq -8(%rbp), %r15
	movq %r15, -216(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -216(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -208(%rbp)
	jmp L128
	jmp L128
	jmp L128
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
	movq $56, %rdi
	call malloc
	movq %rax, -96(%rbp)
	movq $4, %r10
	movq $5, %r8
	movq -96(%rbp), %r11
	movq %r10, 0(%r11)
	movq -96(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 32(%r11)
	movq $4, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 40(%r11)
	movq $5, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 48(%r11)
	movq -96(%rbp), %rdi
	call __print__
	movq $4, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -88(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -16(%rbp)
	movq $7, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -24(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -16(%rbp), %rdi
	call def_f
	movq %rax, %rdi
	call __print__
	movq $0, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-216, %rsp
	movq %rsi, -160(%rbp)
	movq %rdi, -152(%rbp)
	movq -152(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -184(%rbp)
	movq -160(%rbp), %r10
	movq 8(%r10), %r10
	cmpq %r10, -184(%rbp)
	setge %r11b
	movzbq %r11b, %r11
	movq %r11, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -184(%rbp), %r15
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
	movq -152(%rbp), %r10
	movq %r10, 16(%rsi)
	movq -168(%rbp), %rdi
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
