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
	jle L165
	cmpq $1, %r10
	jle L169
	cmpq $2, %r10
	jle L171
	cmpq $3, %r10
	jle L187
	cmpq $4, %r10
	jle L203
L161:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L203:
	movq $0, -56(%rbp)
L202:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jnz L197
L163:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L161
L197:
	movq -56(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	jmp L202
L187:
	movq $0, -40(%rbp)
L186:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -48(%rbp)
	movq $2, %r8
	subq -40(%rbp), %r10
	testq %r10, %r10
	jz L163
	movq -40(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	jmp L186
L171:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L163
L169:
	cmpq $0, %rsi
	jle L167
	movq $.LC2, %rdi
L166:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L163
L167:
	movq $.LC3, %rdi
	jmp L166
L165:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L163
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
	jle L100
	cmpq $1, %r10
	jle L100
	cmpq $2, %r10
	jle L107
	cmpq $3, %r10
	jle L144
	cmpq $4, %r10
	jle L144
L100:
	movq -176(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L144:
	movq -192(%rbp), %r15
	addq -184(%rbp), %r15
	movq %r15, -192(%rbp)
	movq -192(%rbp), %rdi
	call malloc
	movq %rax, %r9
	movq $0, %rax
	addq $2, -160(%rbp)
	addq $2, %r9
L139:
	cmpq %rax, -184(%rbp)
	jle L138
	movq $0, %r10
	addq $2, -168(%rbp)
	addq $2, %r9
L121:
	cmpq %r10, -192(%rbp)
	jl L100
L120:
	movq $8, %rax
	movq %r10, %r8
	imulq %rax, %r8
	addq -168(%rbp), %r8
	movq 0(%r8), %r8
	movq $8, %rcx
	movq %r10, %rax
	imulq %rcx, %rax
	addq %r9, %rax
	movq %r8, 0(%rax)
	incq %r10
	jmp L121
L138:
	movq $8, %r10
	movq %rax, %r8
	imulq %r10, %r8
	addq -160(%rbp), %r8
	movq 0(%r8), %r10
	movq $8, %rcx
	movq %rax, %r8
	imulq %rcx, %r8
	addq %r9, %r8
	movq %r10, 0(%r8)
	incq %rax
	jmp L139
	jmp L144
L107:
	addq %r8, -200(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -200(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -176(%rbp)
	jmp L100
	jmp L100
	jmp L100
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-200, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -96(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -96(%rbp), %r11
	movq %r10, 0(%r11)
	movq -96(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -152(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -152(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 16(%r11)
	movq $40, %rdi
	call malloc
	movq %rax, -104(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -104(%rbp), %r11
	movq %r10, 0(%r11)
	movq -104(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -144(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -144(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -136(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -136(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 24(%r11)
	movq $42, -128(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -128(%rbp), %r15
	movq %r15, 8(%r10)
	movq -104(%rbp), %r11
	movq %r10, 32(%r11)
	movq -104(%rbp), %r15
	movq -96(%rbp), %r11
	movq %r15, 24(%r11)
	movq $1, -120(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -120(%rbp), %r15
	movq %r15, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 32(%r11)
	movq -96(%rbp), %r15
	movq %r15, -72(%rbp)
	movq $2, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r15
	movq %r15, -24(%rbp)
	movq $2, %r10
	addq %r10, -24(%rbp)
	movq $1, -80(%rbp)
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
	movq -72(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq $8, %r8
	movq -24(%rbp), %r9
	imulq %r8, %r9
	addq %r10, %r9
	movq %r9, %r10
	movq 0(%r10), %rdi
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
