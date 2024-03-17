	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -16(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rdi, -152(%rbp)
	movq -152(%rbp), %r15
	movq 0(%r15), %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L146
	cmpq $1, %r10
	jle L150
	cmpq $2, %r10
	jle L152
	cmpq $3, %r10
	jle L168
	cmpq $4, %r10
	jle L194
L144:
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L194:
	movq $0, -8(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L191:
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L188
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L144
L188:
	movq -8(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -152(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %r10
	subq -8(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L175
L169:
	incq -8(%rbp)
	jmp L191
L175:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L169
L168:
	movq $0, -168(%rbp)
L167:
	movq -152(%rbp), %r15
	movq 8(%r15), %r8
	movq $1, -176(%rbp)
	movq $2, %r10
	subq -168(%rbp), %r8
	testq %r8, %r8
	jz L144
	movq -168(%rbp), %r8
	addq %r10, %r8
	movq $8, %r10
	imulq %r10, %r8
	addq -152(%rbp), %r8
	movq 0(%r8), %rdi
	call putchar
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	jmp L167
L152:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L144
L150:
	cmpq $0, %rsi
	jle L148
	movq $.LC2, %rdi
L147:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L144
L148:
	movq $.LC3, %rdi
	jmp L147
L146:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L144
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -144(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq %rsi, -112(%rbp)
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -128(%rbp)
	movq -112(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -136(%rbp)
	cmpq $0, %r10
	jle L83
	cmpq $1, %r10
	jle L83
	cmpq $2, %r10
	jle L90
	cmpq $3, %r10
	jle L127
	cmpq $4, %r10
	jle L127
L83:
	movq -120(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L127:
	movq -136(%rbp), %r15
	addq -128(%rbp), %r15
	movq %r15, -136(%rbp)
	movq -136(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -104(%rbp)
	addq $2, %r10
L122:
	cmpq %r8, -128(%rbp)
	jle L121
	addq -128(%rbp), %r10
	movq $0, %r8
	addq $2, -112(%rbp)
	addq $2, %r10
L104:
	cmpq %r8, -136(%rbp)
	jl L83
L103:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -112(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L104
L121:
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
	jmp L122
	jmp L127
L90:
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -128(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -120(%rbp)
	jmp L83
	jmp L83
	jmp L83
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-176, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -32(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -32(%rbp), %r11
	movq %r10, 0(%r11)
	movq -32(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 64(%r11)
	movq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	movq $0, -72(%rbp)
L18:
	movq -24(%rbp), %r9
	movq -24(%rbp), %r10
	movq 8(%r10), %rax
	movq %r9, %r10
	movq -72(%rbp), %r8
	addq $2, %r8
	cmpq %rax, -72(%rbp)
	jl L11
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L11:
	movq $8, %r10
	imulq %r10, %r8
	addq %r9, %r8
	movq %r8, %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	incq -72(%rbp)
	jmp L18
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
