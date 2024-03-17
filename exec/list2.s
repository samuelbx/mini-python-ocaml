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
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, -176(%rbp)
	movq -176(%rbp), %r15
	movq 0(%r15), %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L154
	cmpq $1, %r10
	jle L158
	cmpq $2, %r10
	jle L160
	cmpq $3, %r10
	jle L176
	cmpq $4, %r10
	jle L202
L152:
	movq -184(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L202:
	movq $0, -24(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L199:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -24(%rbp), %r10
	testq %r10, %r10
	jnz L196
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L152
L196:
	movq -24(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -24(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L183
L177:
	incq -24(%rbp)
	jmp L199
L183:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L177
L176:
	movq $0, -8(%rbp)
L175:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jz L152
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L175
L160:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L152
L158:
	cmpq $0, %rsi
	jle L156
	movq $.LC2, %rdi
L155:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L152
L156:
	movq $.LC3, %rdi
	jmp L155
L154:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L152
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -168(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -168(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rsi, -136(%rbp)
	movq %rdi, -128(%rbp)
	movq -128(%rbp), %r15
	movq 0(%r15), %r10
	movq -128(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -152(%rbp)
	movq -136(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -160(%rbp)
	cmpq $0, %r10
	jle L91
	cmpq $1, %r10
	jle L91
	cmpq $2, %r10
	jle L98
	cmpq $3, %r10
	jle L135
	cmpq $4, %r10
	jle L135
L91:
	movq -144(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L135:
	movq -160(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -160(%rbp)
	movq -160(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -128(%rbp)
	addq $2, %r10
L130:
	cmpq %r8, -152(%rbp)
	jle L129
	addq -152(%rbp), %r10
	movq $0, %r8
	addq $2, -136(%rbp)
	addq $2, %r10
L112:
	cmpq %r8, -160(%rbp)
	jl L91
L111:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -136(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L112
L129:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -128(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L130
	jmp L135
L98:
	movq -152(%rbp), %r15
	addq -160(%rbp), %r15
	movq %r15, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -152(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -144(%rbp)
	jmp L91
	jmp L91
	jmp L91
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -64(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -64(%rbp), %r11
	movq %r10, 0(%r11)
	movq -64(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 16(%r11)
	movq $40, %rdi
	call malloc
	movq %rax, -72(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -72(%rbp), %r11
	movq %r10, 0(%r11)
	movq -72(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 24(%r11)
	movq $42, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 32(%r11)
	movq -72(%rbp), %r15
	movq -64(%rbp), %r11
	movq %r15, 24(%r11)
	movq $1, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -64(%rbp), %r11
	movq %r10, 32(%r11)
	movq -64(%rbp), %r15
	movq %r15, -40(%rbp)
	movq $2, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -88(%rbp)
	movq $2, %r10
	addq %r10, -88(%rbp)
	movq $1, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r10
	movq $2, %r8
	addq %r8, %r10
	movq -40(%rbp), %r9
	movq $8, %r8
	imulq %r8, %r10
	addq %r9, %r10
	movq 0(%r10), %r10
	movq $8, %r8
	movq -88(%rbp), %r9
	imulq %r8, %r9
	addq %r10, %r9
	movq %r9, %r10
	movq 0(%r10), %rdi
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
