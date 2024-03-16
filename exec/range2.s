	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-200, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L176
	cmpq $1, %r10
	jle L180
	cmpq $2, %r10
	jle L182
	cmpq $3, %r10
	jle L198
	cmpq $4, %r10
	jle L214
L172:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L214:
	movq $0, -48(%rbp)
L213:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L208
L174:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L172
L208:
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
	jmp L213
L198:
	movq $0, -32(%rbp)
L197:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L174
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
	jmp L197
L182:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L174
L180:
	cmpq $0, %rsi
	jle L178
	movq $.LC2, %rdi
L177:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L174
L178:
	movq $.LC3, %rdi
	jmp L177
L176:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L174
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-200, %rsp
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
	addq $-200, %rsp
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
	jle L111
	cmpq $1, %r10
	jle L111
	cmpq $2, %r10
	jle L118
	cmpq $3, %r10
	jle L155
	cmpq $4, %r10
	jle L155
L111:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L155:
	movq -192(%rbp), %r15
	addq -184(%rbp), %r15
	movq %r15, -192(%rbp)
	movq -192(%rbp), %rdi
	call malloc
	movq %rax, %rcx
	movq $0, %r10
	addq $2, -160(%rbp)
	addq $2, %rcx
L150:
	cmpq %r10, -184(%rbp)
	jle L149
	movq $0, %r9
	addq $2, -168(%rbp)
	addq $2, %rcx
L132:
	cmpq %r9, -192(%rbp)
	jl L111
L131:
	movq $8, %r8
	movq %r9, %r10
	imulq %r8, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %r10
	movq $8, %rax
	movq %r9, %r8
	imulq %rax, %r8
	addq %rcx, %r8
	movq %r10, 0(%r8)
	incq %r9
	jmp L132
L149:
	movq $8, %r9
	movq %r10, %r8
	imulq %r9, %r8
	addq -160(%rbp), %r8
	movq 0(%r8), %r8
	movq $8, %rax
	movq %r10, %r9
	imulq %rax, %r9
	addq %rcx, %r9
	movq %r8, 0(%r9)
	incq %r10
	jmp L150
	jmp L155
L118:
	addq %r8, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -200(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -176(%rbp)
	jmp L111
	jmp L111
	jmp L111
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-200, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -88(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -88(%rbp), %r11
	movq %r10, 0(%r11)
	movq -88(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -88(%rbp), %r11
	movq %r10, 64(%r11)
	movq -88(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $0, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
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
	movq $6, -72(%rbp)
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
