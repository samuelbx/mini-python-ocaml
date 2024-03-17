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
	movq -104(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L78
	cmpq $1, %r10
	jle L82
	cmpq $2, %r10
	jle L84
	cmpq $3, %r10
	jle L100
	cmpq $4, %r10
	jle L126
L76:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L126:
	movq $0, -96(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L123:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	testq %r10, %r10
	jnz L120
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L76
L120:
	movq -96(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	subq -96(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L107
L101:
	incq -96(%rbp)
	jmp L123
L107:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L101
L100:
	movq $0, -80(%rbp)
L99:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jz L76
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L99
L84:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L76
L82:
	cmpq $0, %rsi
	jle L80
	movq $.LC2, %rdi
L79:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L76
L80:
	movq $.LC3, %rdi
	jmp L79
L78:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L76
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -48(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rsi, -16(%rbp)
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -32(%rbp)
	movq -16(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -40(%rbp)
	cmpq $0, %r10
	jle L15
	cmpq $1, %r10
	jle L15
	cmpq $2, %r10
	jle L22
	cmpq $3, %r10
	jle L59
	cmpq $4, %r10
	jle L59
L15:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L59:
	movq -40(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -8(%rbp)
	addq $2, %r10
L54:
	cmpq %r8, -32(%rbp)
	jle L53
	movq $0, %r8
	addq $2, -16(%rbp)
	addq $2, %r10
L36:
	cmpq %r8, -40(%rbp)
	jl L15
L35:
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
	jmp L36
L53:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -8(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L54
	jmp L59
L22:
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -32(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -24(%rbp)
	jmp L15
	jmp L15
	jmp L15
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	call def_f
	movq %rax, %rdi
	call __print__
	movq %rax, %r10
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq $1, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -72(%rbp), %r15
	movq %r15, 8(%rax)
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
