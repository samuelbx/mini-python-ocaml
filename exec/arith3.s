	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L83
	cmpq $1, %r10
	jle L87
	cmpq $2, %r10
	jle L89
	cmpq $3, %r10
	jle L105
	cmpq $4, %r10
	jle L131
L81:
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L131:
	movq $0, -104(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L128:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	subq -104(%rbp), %r10
	testq %r10, %r10
	jnz L125
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L81
L125:
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
	jnz L112
L106:
	incq -104(%rbp)
	jmp L128
L112:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L106
L105:
	movq $0, -88(%rbp)
L104:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -96(%rbp)
	movq $2, %r8
	subq -88(%rbp), %r10
	testq %r10, %r10
	jz L81
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
	jmp L104
L89:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L81
L87:
	cmpq $0, %rsi
	jle L85
	movq $.LC2, %rdi
L84:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L81
L85:
	movq $.LC3, %rdi
	jmp L84
L83:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L81
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
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
	addq $-112, %rsp
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
	jle L20
	cmpq $1, %r10
	jle L20
	cmpq $2, %r10
	jle L27
	cmpq $3, %r10
	jle L64
	cmpq $4, %r10
	jle L64
L20:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L64:
	movq -48(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -48(%rbp)
	movq -48(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L59:
	cmpq %r8, -40(%rbp)
	jle L58
	movq $0, %r8
	addq $2, -24(%rbp)
	addq $2, %r10
L41:
	cmpq %r8, -48(%rbp)
	jl L20
L40:
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
	jmp L41
L58:
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
	jmp L59
	jmp L64
L27:
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
	jmp L20
	jmp L20
	jmp L20
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq $8, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r10
	movq %r10, 0(%rdi)
	movq -8(%rbp), %r15
	movq %r15, 8(%rdi)
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
