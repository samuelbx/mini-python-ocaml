	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L158
	cmpq $1, %r10
	jle L162
	cmpq $2, %r10
	jle L164
	cmpq $3, %r10
	jle L180
	cmpq $4, %r10
	jle L196
L154:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L196:
	movq $0, -48(%rbp)
L195:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L190
L156:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L154
L190:
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L195
L180:
	movq $0, -32(%rbp)
L179:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L156
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L179
L164:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L156
L162:
	cmpq $0, %rsi
	jle L160
	movq $.LC2, %rdi
L159:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L156
L160:
	movq $.LC3, %rdi
	jmp L159
L158:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L156
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -8(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rsi, -160(%rbp)
	movq %rdi, -152(%rbp)
	movq -152(%rbp), %r15
	movq 0(%r15), %r10
	movq -152(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -176(%rbp)
	movq -160(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -184(%rbp)
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
	movq -168(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L137:
	movq -184(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -184(%rbp)
	movq -184(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -152(%rbp)
	addq $2, %r10
L132:
	cmpq %r8, -176(%rbp)
	jle L131
	movq $0, %r8
	addq $2, -160(%rbp)
	addq $2, %r10
L114:
	cmpq %r8, -184(%rbp)
	jl L93
L113:
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
	jmp L114
L131:
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
	jmp L132
	jmp L137
L100:
	addq %r8, -192(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -192(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -168(%rbp)
	jmp L93
	jmp L93
	jmp L93
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -80(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -80(%rbp), %r11
	movq %r10, 0(%r11)
	movq -80(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -80(%rbp), %r11
	movq %r10, 64(%r11)
	movq -80(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $7, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -64(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq $0, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
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
