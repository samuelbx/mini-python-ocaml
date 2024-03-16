	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -48(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L156
	cmpq $1, %r10
	jle L160
	cmpq $2, %r10
	jle L162
	cmpq $3, %r10
	jle L178
	cmpq $4, %r10
	jle L204
L154:
	movq -16(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L204:
	movq $0, -40(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L201:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	subq -40(%rbp), %r10
	testq %r10, %r10
	jnz L198
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L154
L198:
	movq -40(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	subq -40(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L185
L179:
	incq -40(%rbp)
	jmp L201
L185:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L179
L178:
	movq $0, -24(%rbp)
L177:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -32(%rbp)
	movq $2, %r8
	subq -24(%rbp), %r10
	testq %r10, %r10
	jz L154
	movq -24(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -24(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	jmp L177
L162:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
L160:
	cmpq $0, %rsi
	jle L158
	movq $.LC2, %rdi
L157:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
L158:
	movq $.LC3, %rdi
	jmp L157
L156:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L154
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -184(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rsi, -152(%rbp)
	movq %rdi, -144(%rbp)
	movq -144(%rbp), %r15
	movq 0(%r15), %r10
	movq -144(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -168(%rbp)
	movq -152(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -176(%rbp)
	cmpq $0, %r10
	jle L93
	cmpq $1, %r10
	jle L93
	cmpq $2, %r10
	jle L100
	cmpq $3, %r10
	jle L137
	cmpq $4, %r10
	jle L137
L93:
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L137:
	movq -176(%rbp), %r15
	addq -168(%rbp), %r15
	movq %r15, -176(%rbp)
	movq -176(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -144(%rbp)
	addq $2, %r10
L132:
	cmpq %r8, -168(%rbp)
	jle L131
	movq $0, %r8
	addq $2, -152(%rbp)
	addq $2, %r10
L114:
	cmpq %r8, -176(%rbp)
	jl L93
L113:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -152(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L114
L131:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -144(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L132
	jmp L137
L100:
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -168(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -160(%rbp)
	jmp L93
	jmp L93
	jmp L93
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -72(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -72(%rbp), %r11
	movq %r10, 0(%r11)
	movq -72(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 64(%r11)
	movq -72(%rbp), %r15
	movq %r15, -56(%rbp)
	movq $7, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq $0, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
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
