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
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L174
	cmpq $1, %r10
	jle L178
	cmpq $2, %r10
	jle L180
	cmpq $3, %r10
	jle L196
	cmpq $4, %r10
	jle L222
L172:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L222:
	movq $0, -48(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L219:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L216
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L172
L216:
	movq -48(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	subq -48(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L203
L197:
	incq -48(%rbp)
	jmp L219
L203:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L197
L196:
	movq $0, -32(%rbp)
L195:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L172
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
	jmp L195
L180:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L172
L178:
	cmpq $0, %rsi
	jle L176
	movq $.LC2, %rdi
L175:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L172
L176:
	movq $.LC3, %rdi
	jmp L175
L174:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L172
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
	movq $0, %r8
	addq $2, -168(%rbp)
	addq $2, %rcx
L132:
	cmpq %r8, -192(%rbp)
	jl L111
L131:
	movq $8, %r9
	movq %r8, %r10
	imulq %r9, %r10
	addq -168(%rbp), %r10
	movq 0(%r10), %r10
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq %rcx, %r9
	movq %r10, 0(%r9)
	incq %r8
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
	jmp L111
	jmp L111
	jmp L111
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-192, %rsp
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
