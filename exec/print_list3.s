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
	jle L121
	cmpq $1, %r10
	jle L125
	cmpq $2, %r10
	jle L127
	cmpq $3, %r10
	jle L143
	cmpq $4, %r10
	jle L169
L119:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L169:
	movq $0, -152(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L166:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	subq -152(%rbp), %r10
	testq %r10, %r10
	jnz L163
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L119
L163:
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
	jnz L150
L144:
	incq -152(%rbp)
	jmp L166
L150:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L144
L143:
	movq $0, -128(%rbp)
L142:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L119
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
	jle L58
	cmpq $1, %r10
	jle L58
	cmpq $2, %r10
	jle L65
	cmpq $3, %r10
	jle L102
	cmpq $4, %r10
	jle L102
L58:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L102:
	movq -96(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -96(%rbp)
	movq -96(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -64(%rbp)
	addq $2, %r10
L97:
	cmpq %r8, -88(%rbp)
	jle L96
	movq $0, %r8
	addq $2, -72(%rbp)
	addq $2, %r10
L79:
	cmpq %r8, -96(%rbp)
	jl L58
L78:
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
	jmp L79
L96:
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
	jmp L97
	jmp L102
L65:
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
	jmp L58
	jmp L58
	jmp L58
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -144(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 24(%r11)
	movq -16(%rbp), %r15
	movq -144(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 32(%r11)
	movq -144(%rbp), %rdi
	call __print__
	movq $0, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
