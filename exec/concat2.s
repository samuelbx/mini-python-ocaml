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
	movq -40(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %r15
	movq 0(%r15), %r10
	movq -144(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L144
	cmpq $1, %r10
	jle L148
	cmpq $2, %r10
	jle L150
	cmpq $3, %r10
	jle L166
	cmpq $4, %r10
	jle L192
L142:
	movq -152(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L192:
	movq $0, -32(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L189:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	subq -32(%rbp), %r10
	testq %r10, %r10
	jnz L186
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L142
L186:
	movq -32(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	subq -32(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L173
L167:
	incq -32(%rbp)
	jmp L189
L173:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L167
L166:
	movq $0, -8(%rbp)
L165:
	movq -144(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jz L142
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -144(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L165
L150:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L142
L148:
	cmpq $0, %rsi
	jle L146
	movq $.LC2, %rdi
L145:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L142
L146:
	movq $.LC3, %rdi
	jmp L145
L144:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L142
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
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
	addq $-152, %rsp
	movq %rsi, -104(%rbp)
	movq %rdi, -96(%rbp)
	movq -96(%rbp), %r15
	movq 0(%r15), %r10
	movq -96(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -120(%rbp)
	movq -104(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -128(%rbp)
	cmpq $0, %r10
	jle L81
	cmpq $1, %r10
	jle L81
	cmpq $2, %r10
	jle L88
	cmpq $3, %r10
	jle L125
	cmpq $4, %r10
	jle L125
L81:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L125:
	movq -128(%rbp), %r15
	addq -120(%rbp), %r15
	movq %r15, -128(%rbp)
	movq -128(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -96(%rbp)
	addq $2, %r10
L120:
	cmpq %r8, -120(%rbp)
	jle L119
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L102:
	cmpq %r8, -128(%rbp)
	jl L81
L101:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -104(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L102
L119:
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
	jmp L120
	jmp L125
L88:
	movq -120(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -120(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -112(%rbp)
	jmp L81
	jmp L81
	jmp L81
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $3, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -24(%rbp), %r15
	movq %r15, 8(%rdi)
	call def_make
	movq %rax, %rdi
	call __print__
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
def_make:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	cmpq %r10, -80(%rbp)
	sete %r11b
	movzbq %r11b, %r11
	movq %r11, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L31
	movq $24, %rdi
	call malloc
	movq %rax, %rsi
	movq $3, %r10
	movq $1, %r8
	movq %r10, 0(%rsi)
	movq %r8, 8(%rsi)
	movq $97, %r10
	movq %r10, 16(%rsi)
	movq -48(%rbp), %rdi
	call __add__
	movq %rax, %r10
	movq 8(%r10), %rax
L21:
	movq %rbp, %rsp
	popq %rbp
	ret
L31:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %rax
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
