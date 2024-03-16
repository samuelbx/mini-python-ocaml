	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L162
	cmpq $1, %r10
	jle L166
	cmpq $2, %r10
	jle L168
	cmpq $3, %r10
	jle L184
	cmpq $4, %r10
	jle L210
L160:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L210:
	movq $0, -64(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L207:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L204
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L160
L204:
	movq -64(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	subq -64(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L191
L185:
	incq -64(%rbp)
	jmp L207
L191:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L185
L184:
	movq $0, -48(%rbp)
L183:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jz L160
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L183
L168:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L160
L166:
	cmpq $0, %rsi
	jle L164
	movq $.LC2, %rdi
L163:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L160
L164:
	movq $.LC3, %rdi
	jmp L163
L162:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L160
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -16(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -16(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rsi, -168(%rbp)
	movq %rdi, -160(%rbp)
	movq -160(%rbp), %r15
	movq 0(%r15), %r10
	movq -160(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -184(%rbp)
	movq -168(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -192(%rbp)
	cmpq $0, %r10
	jle L99
	cmpq $1, %r10
	jle L99
	cmpq $2, %r10
	jle L106
	cmpq $3, %r10
	jle L143
	cmpq $4, %r10
	jle L143
L99:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L143:
	movq -192(%rbp), %r15
	addq -184(%rbp), %r15
	movq %r15, -192(%rbp)
	movq -192(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -160(%rbp)
	addq $2, %r10
L138:
	cmpq %r8, -184(%rbp)
	jle L137
	movq $0, %r8
	addq $2, -168(%rbp)
	addq $2, %r10
L120:
	cmpq %r8, -192(%rbp)
	jl L99
L119:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -168(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L120
L137:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -160(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L138
	jmp L143
L106:
	movq -184(%rbp), %r15
	addq -192(%rbp), %r15
	movq %r15, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -184(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -176(%rbp)
	jmp L99
	jmp L99
	jmp L99
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -128(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -128(%rbp), %r11
	movq %r10, 0(%r11)
	movq -128(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -128(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -128(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -128(%rbp), %r11
	movq %r10, 32(%r11)
	movq -128(%rbp), %r15
	movq %r15, -120(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -120(%rbp), %r8
	movq %r8, 16(%r10)
	movq -120(%rbp), %r8
	movq %r8, 24(%r10)
	movq -120(%rbp), %r8
	movq %r8, 32(%r10)
	movq %r10, -8(%rbp)
	movq -8(%rbp), %rdi
	call __print__
	movq $42, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -104(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -72(%rbp)
	movq $1, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -40(%rbp)
	movq $1, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -8(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	addq $2, -40(%rbp)
	movq $8, %r8
	movq -40(%rbp), %r9
	imulq %r8, %r9
	addq %r10, %r9
	movq %r9, %r10
	movq -72(%rbp), %r15
	movq %r15, 0(%r10)
	movq -8(%rbp), %rdi
	call __print__
	movq $0, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
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
