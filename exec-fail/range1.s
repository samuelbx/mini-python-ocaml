	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L111
	cmpq $1, %r10
	jle L115
	cmpq $2, %r10
	jle L117
	cmpq $3, %r10
	jle L133
	cmpq $4, %r10
	jle L159
L109:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L159:
	movq $0, -136(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L156:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	testq %r10, %r10
	jnz L153
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L109
L153:
	movq -136(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	subq -136(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L140
L134:
	incq -136(%rbp)
	jmp L156
L140:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L134
L133:
	movq $0, -120(%rbp)
L132:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -128(%rbp)
	movq $2, %r8
	subq -120(%rbp), %r10
	testq %r10, %r10
	jz L109
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
	jmp L132
L117:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
L115:
	cmpq $0, %rsi
	jle L113
	movq $.LC2, %rdi
L112:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
L113:
	movq $.LC3, %rdi
	jmp L112
L111:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L109
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
	movq %rsi, -56(%rbp)
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	cmpq $0, %r10
	jle L48
	cmpq $1, %r10
	jle L48
	cmpq $2, %r10
	jle L55
	cmpq $3, %r10
	jle L92
	cmpq $4, %r10
	jle L92
L48:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L92:
	movq -80(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L87:
	cmpq %r8, -72(%rbp)
	jle L86
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L69:
	cmpq %r8, -80(%rbp)
	jl L48
L68:
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
	jmp L69
L86:
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
	jmp L87
	jmp L92
L55:
	movq -72(%rbp), %r15
	addq -80(%rbp), %r15
	movq %r15, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -72(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -64(%rbp)
	jmp L48
	jmp L48
	jmp L48
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-144, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq -40(%rbp), %r15
	movq %r15, -16(%rbp)
	addq $2, -16(%rbp)
	movq $8, %rdi
	imulq -16(%rbp), %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -40(%rbp), %r15
	movq -8(%rbp), %r11
	movq %r15, 8(%r11)
	movq $0, -32(%rbp)
L31:
	movq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	addq $2, -24(%rbp)
	movq -24(%rbp), %r10
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L26
	movq -8(%rbp), %r10
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
L26:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq $8, %r9
	movq -24(%rbp), %r8
	imulq %r9, %r8
	addq -8(%rbp), %r8
	movq %r10, 0(%r8)
	incq -32(%rbp)
	jmp L31
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
