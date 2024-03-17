	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L248
	cmpq $1, %r10
	jle L252
	cmpq $2, %r10
	jle L254
	cmpq $3, %r10
	jle L270
	cmpq $4, %r10
	jle L296
L246:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L296:
	movq $0, -144(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L293:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -144(%rbp), %r10
	testq %r10, %r10
	jnz L290
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L246
L290:
	movq -144(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -144(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L277
L271:
	incq -144(%rbp)
	jmp L293
L277:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L271
L270:
	movq $0, -128(%rbp)
L269:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L246
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L269
L254:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L246
L252:
	cmpq $0, %rsi
	jle L250
	movq $.LC2, %rdi
L249:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L246
L250:
	movq $.LC3, %rdi
	jmp L249
L248:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L246
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -96(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rsi, -64(%rbp)
	movq %rdi, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	movq -64(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -88(%rbp)
	cmpq $0, %r10
	jle L185
	cmpq $1, %r10
	jle L185
	cmpq $2, %r10
	jle L192
	cmpq $3, %r10
	jle L229
	cmpq $4, %r10
	jle L229
L185:
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L229:
	movq -88(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -88(%rbp)
	movq -88(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L224:
	cmpq %r8, -80(%rbp)
	jle L223
	addq -80(%rbp), %r10
	movq $0, %r8
	addq $2, -64(%rbp)
	addq $2, %r10
L206:
	cmpq %r8, -88(%rbp)
	jl L185
L205:
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
	jmp L206
L223:
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
	jmp L224
	jmp L229
L192:
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -72(%rbp)
	jmp L185
	jmp L185
	jmp L185
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq $10, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_fact
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	movq $10, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -192(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_factimp
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_fact:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -200(%rbp)
	movq $1, -208(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -208(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -200(%rbp)
	setle %r11b
	movzbq %r11b, %r11
	movq %r11, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -200(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L59
	movq -104(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -152(%rbp)
	movq -104(%rbp), %r10
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
	subq %r10, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -168(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_fact
	movq %rax, %r10
	movq 8(%r10), %r10
	movq -152(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -152(%rbp), %r15
	movq %r15, 8(%rax)
L21:
	movq %rbp, %rsp
	popq %rbp
	ret
L59:
	movq $1, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -184(%rbp), %r15
	movq %r15, 8(%rax)
	jmp L21
def_factimp:
	pushq %rbp
	movq %rsp, %rbp
	addq $-312, %rsp
	movq %rdi, -216(%rbp)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -224(%rbp)
	movq $0, -232(%rbp)
L175:
	movq -216(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %r15
	movq %r15, -16(%rbp)
	addq $2, -16(%rbp)
	movq $8, %rdi
	imulq -16(%rbp), %rdi
	call malloc
	movq %rax, -312(%rbp)
	movq $4, %r10
	movq -312(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r15
	movq -312(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -32(%rbp)
L164:
	movq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	addq $2, -24(%rbp)
	movq -24(%rbp), %r10
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L159
	movq -312(%rbp), %r15
	movq %r15, -240(%rbp)
	movq -216(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -304(%rbp)
	movq -304(%rbp), %r15
	movq %r15, -280(%rbp)
	addq $2, -280(%rbp)
	movq $8, %rdi
	imulq -280(%rbp), %rdi
	call malloc
	movq %rax, -272(%rbp)
	movq $4, %r10
	movq -272(%rbp), %r11
	movq %r10, 0(%r11)
	movq -304(%rbp), %r15
	movq -272(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -296(%rbp)
L134:
	movq -296(%rbp), %r15
	movq %r15, -288(%rbp)
	addq $2, -288(%rbp)
	movq -288(%rbp), %r10
	subq -280(%rbp), %r10
	testq %r10, %r10
	jnz L129
	movq -272(%rbp), %r10
	movq 8(%r10), %r8
	movq -240(%rbp), %r10
	movq -232(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -232(%rbp)
	jl L110
	movq -224(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L110:
	movq $8, %r8
	imulq %r8, %r10
	addq -240(%rbp), %r10
	movq 0(%r10), %rsi
	movq -224(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -248(%rbp)
	movq $1, -264(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r10
	movq %r10, 0(%rsi)
	movq -264(%rbp), %r15
	movq %r15, 8(%rsi)
	movq -256(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %r10
	movq -248(%rbp), %r15
	imulq %r10, %r15
	movq %r15, -248(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -248(%rbp), %r15
	movq %r15, 8(%r10)
	movq %r10, -224(%rbp)
	incq -232(%rbp)
	jmp L175
L129:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -296(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -288(%rbp), %r8
	imulq %r9, %r8
	addq -272(%rbp), %r8
	movq %r10, 0(%r8)
	incq -296(%rbp)
	jmp L134
L159:
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, %r9
	movq $8, %r8
	movq -24(%rbp), %r10
	imulq %r8, %r10
	addq -312(%rbp), %r10
	movq %r9, 0(%r10)
	incq -32(%rbp)
	jmp L164
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
