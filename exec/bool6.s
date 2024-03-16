	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-240, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L275
	cmpq $1, %r10
	jle L279
	cmpq $2, %r10
	jle L281
	cmpq $3, %r10
	jle L297
L271:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L223
	cmpq $1, %r10
	jle L227
	cmpq $2, %r10
	jle L229
	cmpq $3, %r10
	jle L245
L219:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -240(%rbp)
	movq -240(%rbp), %r15
	movq 0(%r15), %r10
	movq -240(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L171
	cmpq $1, %r10
	jle L175
	cmpq $2, %r10
	jle L177
	cmpq $3, %r10
	jle L193
L167:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -200(%rbp)
	movq -200(%rbp), %r15
	movq 0(%r15), %r10
	movq -200(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L119
	cmpq $1, %r10
	jle L123
	cmpq $2, %r10
	jle L125
	cmpq $3, %r10
	jle L141
L115:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -160(%rbp)
	movq -160(%rbp), %r15
	movq 0(%r15), %r10
	movq -160(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L67
	cmpq $1, %r10
	jle L71
	cmpq $2, %r10
	jle L73
	cmpq $3, %r10
	jle L89
L63:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L15
	cmpq $1, %r10
	jle L19
	cmpq $2, %r10
	jle L21
	cmpq $3, %r10
	jle L37
L11:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L37:
	movq $0, -112(%rbp)
L36:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -112(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -112(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -112(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -112(%rbp)
	jmp L36
L21:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L19:
	cmpq $0, %rsi
	jle L17
	movq $.LC2, %rdi
L16:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L17:
	movq $.LC3, %rdi
	jmp L16
L15:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L89:
	movq $0, -168(%rbp)
L88:
	movq -160(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -176(%rbp)
	movq $2, %r8
	subq -168(%rbp), %r10
	testq %r10, %r10
	jnz L83
L65:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L63
L83:
	movq -168(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -160(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -168(%rbp), %r15
	addq -176(%rbp), %r15
	movq %r15, -168(%rbp)
	jmp L88
L73:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L65
L71:
	cmpq $0, %rsi
	jle L69
	movq $.LC2, %rdi
L68:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L65
L69:
	movq $.LC3, %rdi
	jmp L68
L67:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L65
L141:
	movq $0, -208(%rbp)
L140:
	movq -200(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -216(%rbp)
	movq $2, %r8
	subq -208(%rbp), %r10
	testq %r10, %r10
	jnz L135
L117:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L115
L135:
	movq -208(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -200(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -208(%rbp), %r15
	addq -216(%rbp), %r15
	movq %r15, -208(%rbp)
	jmp L140
L125:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
L123:
	cmpq $0, %rsi
	jle L121
	movq $.LC2, %rdi
L120:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
L121:
	movq $.LC3, %rdi
	jmp L120
L119:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L117
L193:
	movq $0, -8(%rbp)
L192:
	movq -240(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L187
L169:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L167
L187:
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -240(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L192
L177:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L169
L175:
	cmpq $0, %rsi
	jle L173
	movq $.LC2, %rdi
L172:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L169
L173:
	movq $.LC3, %rdi
	jmp L172
L171:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L169
L245:
	movq $0, -56(%rbp)
L244:
	movq -48(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -64(%rbp)
	movq $2, %r8
	subq -56(%rbp), %r10
	testq %r10, %r10
	jnz L239
L221:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L219
L239:
	movq -56(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -48(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -56(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -56(%rbp)
	jmp L244
L229:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L221
L227:
	cmpq $0, %rsi
	jle L225
	movq $.LC2, %rdi
L224:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L221
L225:
	movq $.LC3, %rdi
	jmp L224
L223:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L221
L297:
	movq $0, -96(%rbp)
L296:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -104(%rbp)
	movq $2, %r8
	subq -96(%rbp), %r10
	testq %r10, %r10
	jnz L291
L273:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L271
L291:
	movq -96(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -96(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -96(%rbp)
	jmp L296
L281:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L273
L279:
	cmpq $0, %rsi
	jle L277
	movq $.LC2, %rdi
L276:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L273
L277:
	movq $.LC3, %rdi
	jmp L276
L275:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L273
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
