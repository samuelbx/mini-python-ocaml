	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L106
	cmpq $1, %r10
	jle L110
	cmpq $2, %r10
	jle L112
	cmpq $3, %r10
	jle L128
	cmpq $4, %r10
	jle L144
L102:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L144:
	movq $0, -136(%rbp)
L143:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L138
L104:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L102
L138:
	movq -136(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -136(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -136(%rbp)
	jmp L143
L128:
	movq $0, -120(%rbp)
L127:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -128(%rbp)
	movq $2, %r8
	subq -120(%rbp), %r10
	testq %r10, %r10
	jz L104
	movq -120(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -120(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -120(%rbp)
	jmp L127
L112:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L104
L110:
	cmpq $0, %rsi
	jle L108
	movq $.LC2, %rdi
L107:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L104
L108:
	movq $.LC3, %rdi
	jmp L107
L106:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L104
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
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
	addq $-144, %rsp
	movq %rsi, -48(%rbp)
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	cmpq $0, %r10
	jle L41
	cmpq $1, %r10
	jle L41
	cmpq $2, %r10
	jle L48
	cmpq $3, %r10
	jle L85
	cmpq $4, %r10
	jle L85
L41:
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L85:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L80:
	cmpq %r8, -64(%rbp)
	jle L79
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L62:
	cmpq %r8, -72(%rbp)
	jl L41
L61:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -48(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L62
L79:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -40(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L80
	jmp L85
L48:
	addq %r8, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -80(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -56(%rbp)
	jmp L41
	jmp L41
	jmp L41
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $0, -8(%rbp)
L39:
	movq $42, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -16(%rbp)
	movq $42, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq -16(%rbp), %r10
	movq -8(%rbp), %r10
	addq $2, %r10
	cmpq %r8, -8(%rbp)
	jl L20
	movq $0, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L20:
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	incq -8(%rbp)
	jmp L39
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
