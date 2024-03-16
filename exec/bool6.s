	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
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
	addq $-104, %rsp
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
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
	jle L171
L121:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L171:
	movq $0, -104(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L168:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L165
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L121
L165:
	movq -104(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	subq -104(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L152
L146:
	incq -104(%rbp)
	jmp L168
L152:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L146
L145:
	movq $0, -88(%rbp)
L144:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jz L121
	movq -88(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -88(%rbp), %r15
	addq -96(%rbp), %r15
	movq %r15, -88(%rbp)
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
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -64(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rsi, -32(%rbp)
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -48(%rbp)
	movq -32(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -56(%rbp)
	cmpq $0, %r10
	jle L60
	cmpq $1, %r10
	jle L60
	cmpq $2, %r10
	jle L67
	cmpq $3, %r10
	jle L104
	cmpq $4, %r10
	jle L104
L60:
	movq -40(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L104:
	movq -56(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -56(%rbp)
	movq -56(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L99:
	cmpq %r8, -48(%rbp)
	jle L98
	movq $0, %r8
	addq $2, -32(%rbp)
	addq $2, %r10
L81:
	cmpq %r8, -56(%rbp)
	jl L60
L80:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -32(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L81
L98:
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
	jmp L99
	jmp L104
L67:
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -40(%rbp)
	jmp L60
	jmp L60
	jmp L60
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $0, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
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
