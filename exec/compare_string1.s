	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
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
	addq $-96, %rsp
	movq %rdi, -64(%rbp)
	movq -64(%rbp), %r15
	movq 0(%r15), %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L138
	cmpq $1, %r10
	jle L142
	cmpq $2, %r10
	jle L144
	cmpq $3, %r10
	jle L160
	cmpq $4, %r10
	jle L186
L136:
	movq -72(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L186:
	movq $0, -96(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L183:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	testq %r10, %r10
	jnz L180
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L136
L180:
	movq -96(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L167
L161:
	incq -96(%rbp)
	jmp L183
L167:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L161
L160:
	movq $0, -80(%rbp)
L159:
	movq -64(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jz L136
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -64(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L159
L144:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L136
L142:
	cmpq $0, %rsi
	jle L140
	movq $.LC2, %rdi
L139:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L136
L140:
	movq $.LC3, %rdi
	jmp L139
L138:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L136
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -56(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq %rsi, -24(%rbp)
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -40(%rbp)
	movq -24(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -48(%rbp)
	cmpq $0, %r10
	jle L75
	cmpq $1, %r10
	jle L75
	cmpq $2, %r10
	jle L82
	cmpq $3, %r10
	jle L119
	cmpq $4, %r10
	jle L119
L75:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L119:
	movq -48(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L114:
	cmpq %r8, -40(%rbp)
	jle L113
	addq -40(%rbp), %r10
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L96:
	cmpq %r8, -48(%rbp)
	jl L75
L95:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -24(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L96
L113:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -16(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L114
	jmp L119
L82:
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -40(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -32(%rbp)
	jmp L75
	jmp L75
	jmp L75
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq %rax, %r10
	movq $0, %rax
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
