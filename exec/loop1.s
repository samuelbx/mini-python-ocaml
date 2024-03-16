	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
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
	addq $-160, %rsp
	movq %rdi, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L119
	cmpq $1, %r10
	jle L123
	cmpq $2, %r10
	jle L125
	cmpq $3, %r10
	jle L141
	cmpq $4, %r10
	jle L167
L117:
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L167:
	movq $0, -160(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L164:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	subq -160(%rbp), %r10
	testq %r10, %r10
	jnz L161
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L117
L161:
	movq -160(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	subq -160(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L148
L142:
	incq -160(%rbp)
	jmp L164
L148:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L142
L141:
	movq $0, -144(%rbp)
L140:
	movq -128(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -152(%rbp)
	movq $2, %r8
	subq -144(%rbp), %r10
	testq %r10, %r10
	jz L117
	movq -144(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -128(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -144(%rbp)
	jmp L140
L125:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
L123:
	cmpq $0, %rsi
	jle L121
	movq $.LC2, %rdi
L120:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
L121:
	movq $.LC3, %rdi
	jmp L120
L119:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -120(%rbp), %r15
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
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L100:
	movq -112(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -112(%rbp)
	movq -112(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -80(%rbp)
	addq $2, %r10
L95:
	cmpq %r8, -104(%rbp)
	jle L94
	movq $0, %r8
	addq $2, -88(%rbp)
	addq $2, %r10
L77:
	cmpq %r8, -112(%rbp)
	jl L56
L76:
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
	jmp L77
L94:
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
	jmp L95
	jmp L100
L63:
	movq -104(%rbp), %r15
	addq -112(%rbp), %r15
	movq %r15, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -104(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -96(%rbp)
	jmp L56
	jmp L56
	jmp L56
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $0, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -16(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_loop
	movq %rax, %r10
	movq 8(%r10), %r10
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
def_loop:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, -32(%rbp)
	movq -32(%rbp), %rdi
	call __print__
	movq %rax, -24(%rbp)
	movq -32(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $3, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -56(%rbp)
	setl %r11b
	movzbq %r11b, %r11
	movq %r11, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L33
L21:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L33:
	movq -32(%rbp), %rsi
	movq -40(%rbp), %rdi
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
