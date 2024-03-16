	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L157
	cmpq $1, %r10
	jle L161
	cmpq $2, %r10
	jle L163
	cmpq $3, %r10
	jle L179
	cmpq $4, %r10
	jle L195
L153:
	movq -16(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L195:
	movq $0, -48(%rbp)
L194:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L189
L155:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L153
L189:
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L194
L179:
	movq $0, -32(%rbp)
L178:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L155
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L178
L163:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L155
L161:
	cmpq $0, %rsi
	jle L159
	movq $.LC2, %rdi
L158:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L155
L159:
	movq $.LC3, %rdi
	jmp L158
L157:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L155
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -192(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
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
	jle L92
	cmpq $1, %r10
	jle L92
	cmpq $2, %r10
	jle L99
	cmpq $3, %r10
	jle L136
	cmpq $4, %r10
	jle L136
L92:
	movq -160(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L136:
	movq -176(%rbp), %r15
	addq -168(%rbp), %r15
	movq %r15, -176(%rbp)
	movq -176(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -144(%rbp)
	addq $2, %r10
L131:
	cmpq %r8, -168(%rbp)
	jle L130
	movq $0, %r8
	addq $2, -152(%rbp)
	addq $2, %r10
L113:
	cmpq %r8, -176(%rbp)
	jl L92
L112:
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
	jmp L113
L130:
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
	jmp L131
	jmp L136
L99:
	addq %r8, -184(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -184(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -160(%rbp)
	jmp L92
	jmp L92
	jmp L92
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
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
	movq %r15, -64(%rbp)
	movq $0, -24(%rbp)
L27:
	movq -64(%rbp), %r8
	movq -64(%rbp), %r10
	movq 8(%r10), %r9
	movq -24(%rbp), %r10
	addq $2, %r10
	cmpq %r9, -24(%rbp)
	jl L20
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
L20:
	movq $8, %r9
	imulq %r9, %r10
	addq %r8, %r10
	movq 0(%r10), %rdi
	call __print__
	incq -24(%rbp)
	jmp L27
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
