	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L123
	cmpq $1, %r10
	jle L127
	cmpq $2, %r10
	jle L129
	cmpq $3, %r10
	jle L145
	cmpq $4, %r10
	jle L161
L119:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L161:
	movq $0, -152(%rbp)
L160:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -160(%rbp)
	movq $2, %r8
	subq -152(%rbp), %r10
	testq %r10, %r10
	jnz L155
L121:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L119
L155:
	movq -152(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -112(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -152(%rbp), %r15
	addq -160(%rbp), %r15
	movq %r15, -152(%rbp)
	jmp L160
L145:
	movq $0, -128(%rbp)
L144:
	movq -112(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jz L121
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
	jmp L144
L129:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L121
L127:
	cmpq $0, %rsi
	jle L125
	movq $.LC2, %rdi
L124:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L121
L125:
	movq $.LC3, %rdi
	jmp L124
L123:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L121
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
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
	addq $-160, %rsp
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
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L102:
	movq -88(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -88(%rbp)
	movq -88(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L97:
	cmpq %r8, -80(%rbp)
	jle L96
	movq $0, %r8
	addq $2, -64(%rbp)
	addq $2, %r10
L79:
	cmpq %r8, -88(%rbp)
	jl L58
L78:
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
	jmp L79
L96:
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
	jmp L97
	jmp L102
L65:
	addq %r8, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -96(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -72(%rbp)
	jmp L58
	jmp L58
	jmp L58
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -144(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -144(%rbp), %r11
	movq %r10, 0(%r11)
	movq -144(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 16(%r11)
	movq $32, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq $2, %r8
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -8(%rbp), %r11
	movq %r8, 8(%r11)
	movq $2, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 16(%r11)
	movq $3, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 24(%r11)
	movq -8(%rbp), %r15
	movq -144(%rbp), %r11
	movq %r15, 24(%r11)
	movq $4, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -16(%rbp), %r15
	movq %r15, 8(%r10)
	movq -144(%rbp), %r11
	movq %r10, 32(%r11)
	movq -144(%rbp), %rdi
	call __print__
	movq $0, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
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
