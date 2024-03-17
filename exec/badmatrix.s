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
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, -168(%rbp)
	movq -168(%rbp), %r15
	movq 0(%r15), %r10
	movq -168(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L153
	cmpq $1, %r10
	jle L157
	cmpq $2, %r10
	jle L159
	cmpq $3, %r10
	jle L175
	cmpq $4, %r10
	jle L201
L151:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L201:
	movq $0, -16(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L198:
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L195
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L151
L195:
	movq -16(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	subq -16(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L182
L176:
	incq -16(%rbp)
	jmp L198
L182:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L176
L175:
	movq $0, -184(%rbp)
L174:
	movq -168(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -8(%rbp)
	movq $2, %r8
	subq -184(%rbp), %r10
	testq %r10, %r10
	jz L151
	movq -184(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -184(%rbp), %r15
	addq -8(%rbp), %r15
	movq %r15, -184(%rbp)
	jmp L174
L159:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L151
L157:
	cmpq $0, %rsi
	jle L155
	movq $.LC2, %rdi
L154:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L151
L155:
	movq $.LC3, %rdi
	jmp L154
L153:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L151
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -160(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -160(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq %rsi, -120(%rbp)
	movq %rdi, -112(%rbp)
	movq -112(%rbp), %r15
	movq 0(%r15), %r10
	movq -112(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -144(%rbp)
	movq -120(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -152(%rbp)
	cmpq $0, %r10
	jle L90
	cmpq $1, %r10
	jle L90
	cmpq $2, %r10
	jle L97
	cmpq $3, %r10
	jle L134
	cmpq $4, %r10
	jle L134
L90:
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L134:
	movq -152(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -152(%rbp)
	movq -152(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -112(%rbp)
	addq $2, %r10
L129:
	cmpq %r8, -144(%rbp)
	jle L128
	addq -144(%rbp), %r10
	movq $0, %r8
	addq $2, -120(%rbp)
	addq $2, %r10
L111:
	cmpq %r8, -152(%rbp)
	jl L90
L110:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -120(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L111
L128:
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
	jmp L129
	jmp L134
L97:
	movq -144(%rbp), %r15
	addq -152(%rbp), %r15
	movq %r15, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -144(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -136(%rbp)
	jmp L90
	jmp L90
	jmp L90
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -72(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -72(%rbp), %r11
	movq %r10, 0(%r11)
	movq -72(%rbp), %r11
	movq %r8, 8(%r11)
	movq $1, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 16(%r11)
	movq $2, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 24(%r11)
	movq $3, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -72(%rbp), %r11
	movq %r10, 32(%r11)
	movq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -64(%rbp), %r8
	movq %r8, 16(%r10)
	movq -64(%rbp), %r8
	movq %r8, 24(%r10)
	movq -64(%rbp), %r8
	movq %r8, 32(%r10)
	movq %r10, -56(%rbp)
	movq -56(%rbp), %rdi
	call __print__
	movq %rax, %r10
	movq $42, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -48(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -128(%rbp)
	movq $1, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $1, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -56(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	addq $2, -80(%rbp)
	movq $8, %r8
	movq -80(%rbp), %r9
	imulq %r8, %r9
	addq %r10, %r9
	movq %r9, %r10
	movq -128(%rbp), %r15
	movq %r15, 0(%r10)
	movq -56(%rbp), %rdi
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
