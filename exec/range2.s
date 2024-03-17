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
	movq -40(%rbp), %rax
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
	jle L165
	cmpq $1, %r10
	jle L169
	cmpq $2, %r10
	jle L171
	cmpq $3, %r10
	jle L187
	cmpq $4, %r10
	jle L213
L163:
	movq -184(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L213:
	movq $0, -32(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L210:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -32(%rbp), %r10
	testq %r10, %r10
	jnz L207
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L163
L207:
	movq -32(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -176(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	subq -32(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L194
L188:
	incq -32(%rbp)
	jmp L210
L194:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L188
L187:
	movq $0, -8(%rbp)
L186:
	movq -176(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jz L163
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
	movq %rsi, -128(%rbp)
	movq %rdi, -120(%rbp)
	movq -120(%rbp), %r15
	movq 0(%r15), %r10
	movq -120(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -144(%rbp)
	movq -128(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -152(%rbp)
	cmpq $0, %r10
	jle L102
	cmpq $1, %r10
	jle L102
	cmpq $2, %r10
	jle L109
	cmpq $3, %r10
	jle L146
	cmpq $4, %r10
	jle L146
L102:
	movq -136(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L146:
	movq -152(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -152(%rbp)
	movq -152(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -120(%rbp)
	addq $2, %r10
L141:
	cmpq %r8, -144(%rbp)
	jle L140
	addq -144(%rbp), %r10
	movq $0, %r8
	addq $2, -128(%rbp)
	addq $2, %r10
L123:
	cmpq %r8, -152(%rbp)
	jl L102
L122:
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
	jmp L123
L140:
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
	jmp L141
	jmp L146
L109:
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
	jmp L102
	jmp L102
	jmp L102
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-184, %rsp
	movq $72, %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $7, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $0, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -112(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 16(%r11)
	movq $1, -104(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -104(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 24(%r11)
	movq $2, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -96(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 32(%r11)
	movq $3, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -88(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 40(%r11)
	movq $4, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -80(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 48(%r11)
	movq $5, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -72(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 56(%r11)
	movq $6, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
	movq %r15, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 64(%r11)
	movq -56(%rbp), %r15
	movq %r15, -160(%rbp)
	movq $0, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -160(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq %rax, %r10
	movq $6, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -160(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
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
