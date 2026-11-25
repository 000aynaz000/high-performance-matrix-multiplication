
matrix_mult_v2.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <scanf>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	48 83 ec 38          	sub    $0x38,%rsp
   6:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   b:	48 89 4d 20          	mov    %rcx,0x20(%rbp)
   f:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  13:	4c 89 45 30          	mov    %r8,0x30(%rbp)
  17:	4c 89 4d 38          	mov    %r9,0x38(%rbp)
  1b:	48 8d 45 28          	lea    0x28(%rbp),%rax
  1f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  23:	48 8b 5d f0          	mov    -0x10(%rbp),%rbx
  27:	b9 00 00 00 00       	mov    $0x0,%ecx
  2c:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 33 <scanf+0x33>
  33:	ff d0                	call   *%rax
  35:	48 89 c1             	mov    %rax,%rcx
  38:	48 8b 45 20          	mov    0x20(%rbp),%rax
  3c:	49 89 d8             	mov    %rbx,%r8
  3f:	48 89 c2             	mov    %rax,%rdx
  42:	e8 00 00 00 00       	call   47 <scanf+0x47>
  47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4d:	48 83 c4 38          	add    $0x38,%rsp
  51:	5b                   	pop    %rbx
  52:	5d                   	pop    %rbp
  53:	c3                   	ret

0000000000000054 <printf>:
  54:	55                   	push   %rbp
  55:	53                   	push   %rbx
  56:	48 83 ec 38          	sub    $0x38,%rsp
  5a:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  5f:	48 89 4d 20          	mov    %rcx,0x20(%rbp)
  63:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  67:	4c 89 45 30          	mov    %r8,0x30(%rbp)
  6b:	4c 89 4d 38          	mov    %r9,0x38(%rbp)
  6f:	48 8d 45 28          	lea    0x28(%rbp),%rax
  73:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  77:	48 8b 5d f0          	mov    -0x10(%rbp),%rbx
  7b:	b9 01 00 00 00       	mov    $0x1,%ecx
  80:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 87 <printf+0x33>
  87:	ff d0                	call   *%rax
  89:	48 89 c1             	mov    %rax,%rcx
  8c:	48 8b 45 20          	mov    0x20(%rbp),%rax
  90:	49 89 d8             	mov    %rbx,%r8
  93:	48 89 c2             	mov    %rax,%rdx
  96:	e8 00 00 00 00       	call   9b <printf+0x47>
  9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  a1:	48 83 c4 38          	add    $0x38,%rsp
  a5:	5b                   	pop    %rbx
  a6:	5d                   	pop    %rbp
  a7:	c3                   	ret

00000000000000a8 <time>:
  a8:	55                   	push   %rbp
  a9:	48 89 e5             	mov    %rsp,%rbp
  ac:	48 83 ec 20          	sub    $0x20,%rsp
  b0:	48 89 4d 10          	mov    %rcx,0x10(%rbp)
  b4:	48 8b 45 10          	mov    0x10(%rbp),%rax
  b8:	48 89 c1             	mov    %rax,%rcx
  bb:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # c2 <time+0x1a>
  c2:	ff d0                	call   *%rax
  c4:	48 83 c4 20          	add    $0x20,%rsp
  c8:	5d                   	pop    %rbp
  c9:	c3                   	ret

00000000000000ca <fill>:
  ca:	55                   	push   %rbp
  cb:	48 83 ec 40          	sub    $0x40,%rsp
  cf:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  d4:	0f 11 75 00          	movups %xmm6,0x0(%rbp)
  d8:	48 89 4d 20          	mov    %rcx,0x20(%rbp)
  dc:	89 55 28             	mov    %edx,0x28(%rbp)
  df:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  e6:	8b 45 28             	mov    0x28(%rbp),%eax
  e9:	0f af c0             	imul   %eax,%eax
  ec:	89 45 28             	mov    %eax,0x28(%rbp)
  ef:	e9 81 00 00 00       	jmp    175 <fill+0xab>
  f4:	e8 00 00 00 00       	call   f9 <fill+0x2f>
  f9:	48 63 d0             	movslq %eax,%rdx
  fc:	48 69 d2 8f ef e0 a9 	imul   $0xffffffffa9e0ef8f,%rdx,%rdx
 103:	48 c1 ea 20          	shr    $0x20,%rdx
 107:	01 c2                	add    %eax,%edx
 109:	c1 fa 0d             	sar    $0xd,%edx
 10c:	89 c1                	mov    %eax,%ecx
 10e:	c1 f9 1f             	sar    $0x1f,%ecx
 111:	29 ca                	sub    %ecx,%edx
 113:	69 ca 39 30 00 00    	imul   $0x3039,%edx,%ecx
 119:	29 c8                	sub    %ecx,%eax
 11b:	89 c2                	mov    %eax,%edx
 11d:	8d 42 01             	lea    0x1(%rdx),%eax
 120:	66 0f ef f6          	pxor   %xmm6,%xmm6
 124:	f2 0f 2a f0          	cvtsi2sd %eax,%xmm6
 128:	e8 00 00 00 00       	call   12d <fill+0x63>
 12d:	48 63 d0             	movslq %eax,%rdx
 130:	48 69 d2 85 c3 73 9a 	imul   $0xffffffff9a73c385,%rdx,%rdx
 137:	48 c1 ea 20          	shr    $0x20,%rdx
 13b:	01 c2                	add    %eax,%edx
 13d:	c1 fa 0c             	sar    $0xc,%edx
 140:	89 c1                	mov    %eax,%ecx
 142:	c1 f9 1f             	sar    $0x1f,%ecx
 145:	29 ca                	sub    %ecx,%edx
 147:	69 ca 85 1a 00 00    	imul   $0x1a85,%edx,%ecx
 14d:	29 c8                	sub    %ecx,%eax
 14f:	89 c2                	mov    %eax,%edx
 151:	8d 42 01             	lea    0x1(%rdx),%eax
 154:	66 0f ef c9          	pxor   %xmm1,%xmm1
 158:	f2 0f 2a c8          	cvtsi2sd %eax,%xmm1
 15c:	66 0f 28 c6          	movapd %xmm6,%xmm0
 160:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
 164:	48 8b 45 20          	mov    0x20(%rbp),%rax
 168:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 16c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 170:	48 83 45 20 08       	addq   $0x8,0x20(%rbp)
 175:	8b 45 fc             	mov    -0x4(%rbp),%eax
 178:	3b 45 28             	cmp    0x28(%rbp),%eax
 17b:	0f 8c 73 ff ff ff    	jl     f4 <fill+0x2a>
 181:	90                   	nop
 182:	90                   	nop
 183:	0f 10 75 00          	movups 0x0(%rbp),%xmm6
 187:	48 83 c4 40          	add    $0x40,%rsp
 18b:	5d                   	pop    %rbp
 18c:	c3                   	ret

000000000000018d <matrix_mult_index>:
 18d:	55                   	push   %rbp
 18e:	48 89 e5             	mov    %rsp,%rbp
 191:	48 83 ec 10          	sub    $0x10,%rsp
 195:	89 4d 10             	mov    %ecx,0x10(%rbp)
 198:	48 89 55 18          	mov    %rdx,0x18(%rbp)
 19c:	4c 89 45 20          	mov    %r8,0x20(%rbp)
 1a0:	4c 89 4d 28          	mov    %r9,0x28(%rbp)
 1a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 1ab:	e9 f7 00 00 00       	jmp    2a7 <matrix_mult_index+0x11a>
 1b0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 1b7:	e9 db 00 00 00       	jmp    297 <matrix_mult_index+0x10a>
 1bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
 1bf:	0f af 45 10          	imul   0x10(%rbp),%eax
 1c3:	89 c2                	mov    %eax,%edx
 1c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
 1c8:	01 d0                	add    %edx,%eax
 1ca:	48 98                	cltq
 1cc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 1d3:	00 
 1d4:	48 8b 45 28          	mov    0x28(%rbp),%rax
 1d8:	48 01 d0             	add    %rdx,%rax
 1db:	66 0f ef c0          	pxor   %xmm0,%xmm0
 1df:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 1e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 1ea:	e9 98 00 00 00       	jmp    287 <matrix_mult_index+0xfa>
 1ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
 1f2:	0f af 45 10          	imul   0x10(%rbp),%eax
 1f6:	89 c2                	mov    %eax,%edx
 1f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
 1fb:	01 d0                	add    %edx,%eax
 1fd:	48 98                	cltq
 1ff:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 206:	00 
 207:	48 8b 45 28          	mov    0x28(%rbp),%rax
 20b:	48 01 d0             	add    %rdx,%rax
 20e:	f2 0f 10 08          	movsd  (%rax),%xmm1
 212:	8b 45 fc             	mov    -0x4(%rbp),%eax
 215:	0f af 45 10          	imul   0x10(%rbp),%eax
 219:	89 c2                	mov    %eax,%edx
 21b:	8b 45 f4             	mov    -0xc(%rbp),%eax
 21e:	01 d0                	add    %edx,%eax
 220:	48 98                	cltq
 222:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 229:	00 
 22a:	48 8b 45 18          	mov    0x18(%rbp),%rax
 22e:	48 01 d0             	add    %rdx,%rax
 231:	f2 0f 10 10          	movsd  (%rax),%xmm2
 235:	8b 45 f4             	mov    -0xc(%rbp),%eax
 238:	0f af 45 10          	imul   0x10(%rbp),%eax
 23c:	89 c2                	mov    %eax,%edx
 23e:	8b 45 f8             	mov    -0x8(%rbp),%eax
 241:	01 d0                	add    %edx,%eax
 243:	48 98                	cltq
 245:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 24c:	00 
 24d:	48 8b 45 20          	mov    0x20(%rbp),%rax
 251:	48 01 d0             	add    %rdx,%rax
 254:	f2 0f 10 00          	movsd  (%rax),%xmm0
 258:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
 25c:	8b 45 fc             	mov    -0x4(%rbp),%eax
 25f:	0f af 45 10          	imul   0x10(%rbp),%eax
 263:	89 c2                	mov    %eax,%edx
 265:	8b 45 f8             	mov    -0x8(%rbp),%eax
 268:	01 d0                	add    %edx,%eax
 26a:	48 98                	cltq
 26c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 273:	00 
 274:	48 8b 45 28          	mov    0x28(%rbp),%rax
 278:	48 01 d0             	add    %rdx,%rax
 27b:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
 27f:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 283:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
 287:	8b 45 f4             	mov    -0xc(%rbp),%eax
 28a:	3b 45 10             	cmp    0x10(%rbp),%eax
 28d:	0f 8c 5c ff ff ff    	jl     1ef <matrix_mult_index+0x62>
 293:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 297:	8b 45 f8             	mov    -0x8(%rbp),%eax
 29a:	3b 45 10             	cmp    0x10(%rbp),%eax
 29d:	0f 8c 19 ff ff ff    	jl     1bc <matrix_mult_index+0x2f>
 2a3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 2a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
 2aa:	3b 45 10             	cmp    0x10(%rbp),%eax
 2ad:	0f 8c fd fe ff ff    	jl     1b0 <matrix_mult_index+0x23>
 2b3:	90                   	nop
 2b4:	90                   	nop
 2b5:	48 83 c4 10          	add    $0x10,%rsp
 2b9:	5d                   	pop    %rbp
 2ba:	c3                   	ret

00000000000002bb <matrix_mult_ptr_reg>:
 2bb:	55                   	push   %rbp
 2bc:	41 55                	push   %r13
 2be:	41 54                	push   %r12
 2c0:	57                   	push   %rdi
 2c1:	56                   	push   %rsi
 2c2:	53                   	push   %rbx
 2c3:	48 83 ec 18          	sub    $0x18,%rsp
 2c7:	48 8d 2c 24          	lea    (%rsp),%rbp
 2cb:	0f 11 75 00          	movups %xmm6,0x0(%rbp)
 2cf:	89 4d 50             	mov    %ecx,0x50(%rbp)
 2d2:	48 89 55 58          	mov    %rdx,0x58(%rbp)
 2d6:	4c 89 45 60          	mov    %r8,0x60(%rbp)
 2da:	4c 89 4d 68          	mov    %r9,0x68(%rbp)
 2de:	41 bc 00 00 00 00    	mov    $0x0,%r12d
 2e4:	eb 7a                	jmp    360 <matrix_mult_ptr_reg+0xa5>
 2e6:	bb 00 00 00 00       	mov    $0x0,%ebx
 2eb:	eb 5d                	jmp    34a <matrix_mult_ptr_reg+0x8f>
 2ed:	66 0f ef f6          	pxor   %xmm6,%xmm6
 2f1:	41 bd 00 00 00 00    	mov    $0x0,%r13d
 2f7:	48 8b 75 58          	mov    0x58(%rbp),%rsi
 2fb:	48 63 c3             	movslq %ebx,%rax
 2fe:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 305:	00 
 306:	48 8b 45 60          	mov    0x60(%rbp),%rax
 30a:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
 30e:	eb 24                	jmp    334 <matrix_mult_ptr_reg+0x79>
 310:	f2 0f 10 0e          	movsd  (%rsi),%xmm1
 314:	f2 0f 10 07          	movsd  (%rdi),%xmm0
 318:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
 31c:	f2 0f 58 f0          	addsd  %xmm0,%xmm6
 320:	41 83 c5 01          	add    $0x1,%r13d
 324:	48 83 c6 08          	add    $0x8,%rsi
 328:	8b 45 50             	mov    0x50(%rbp),%eax
 32b:	48 98                	cltq
 32d:	48 c1 e0 03          	shl    $0x3,%rax
 331:	48 01 c7             	add    %rax,%rdi
 334:	44 3b 6d 50          	cmp    0x50(%rbp),%r13d
 338:	7c d6                	jl     310 <matrix_mult_ptr_reg+0x55>
 33a:	48 8b 45 68          	mov    0x68(%rbp),%rax
 33e:	f2 0f 11 30          	movsd  %xmm6,(%rax)
 342:	83 c3 01             	add    $0x1,%ebx
 345:	48 83 45 68 08       	addq   $0x8,0x68(%rbp)
 34a:	3b 5d 50             	cmp    0x50(%rbp),%ebx
 34d:	7c 9e                	jl     2ed <matrix_mult_ptr_reg+0x32>
 34f:	41 83 c4 01          	add    $0x1,%r12d
 353:	8b 45 50             	mov    0x50(%rbp),%eax
 356:	48 98                	cltq
 358:	48 c1 e0 03          	shl    $0x3,%rax
 35c:	48 01 45 58          	add    %rax,0x58(%rbp)
 360:	44 3b 65 50          	cmp    0x50(%rbp),%r12d
 364:	7c 80                	jl     2e6 <matrix_mult_ptr_reg+0x2b>
 366:	90                   	nop
 367:	90                   	nop
 368:	0f 10 75 00          	movups 0x0(%rbp),%xmm6
 36c:	48 83 c4 18          	add    $0x18,%rsp
 370:	5b                   	pop    %rbx
 371:	5e                   	pop    %rsi
 372:	5f                   	pop    %rdi
 373:	41 5c                	pop    %r12
 375:	41 5d                	pop    %r13
 377:	5d                   	pop    %rbp
 378:	c3                   	ret

0000000000000379 <matrix_mult_ptr_no_reg>:
 379:	55                   	push   %rbp
 37a:	48 89 e5             	mov    %rsp,%rbp
 37d:	48 83 ec 30          	sub    $0x30,%rsp
 381:	89 4d 10             	mov    %ecx,0x10(%rbp)
 384:	48 89 55 18          	mov    %rdx,0x18(%rbp)
 388:	4c 89 45 20          	mov    %r8,0x20(%rbp)
 38c:	4c 89 4d 28          	mov    %r9,0x28(%rbp)
 390:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
 397:	e9 b1 00 00 00       	jmp    44d <matrix_mult_ptr_no_reg+0xd4>
 39c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
 3a3:	e9 88 00 00 00       	jmp    430 <matrix_mult_ptr_no_reg+0xb7>
 3a8:	66 0f ef c0          	pxor   %xmm0,%xmm0
 3ac:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
 3b1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
 3b8:	48 8b 45 18          	mov    0x18(%rbp),%rax
 3bc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 3c0:	8b 45 e0             	mov    -0x20(%rbp),%eax
 3c3:	48 98                	cltq
 3c5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
 3cc:	00 
 3cd:	48 8b 45 20          	mov    0x20(%rbp),%rax
 3d1:	48 01 d0             	add    %rdx,%rax
 3d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 3d8:	eb 38                	jmp    412 <matrix_mult_ptr_no_reg+0x99>
 3da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 3de:	f2 0f 10 08          	movsd  (%rax),%xmm1
 3e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3e6:	f2 0f 10 00          	movsd  (%rax),%xmm0
 3ea:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
 3ee:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
 3f3:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
 3f7:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
 3fc:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
 400:	48 83 45 f0 08       	addq   $0x8,-0x10(%rbp)
 405:	8b 45 10             	mov    0x10(%rbp),%eax
 408:	48 98                	cltq
 40a:	48 c1 e0 03          	shl    $0x3,%rax
 40e:	48 01 45 e8          	add    %rax,-0x18(%rbp)
 412:	8b 45 dc             	mov    -0x24(%rbp),%eax
 415:	3b 45 10             	cmp    0x10(%rbp),%eax
 418:	7c c0                	jl     3da <matrix_mult_ptr_no_reg+0x61>
 41a:	48 8b 45 28          	mov    0x28(%rbp),%rax
 41e:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
 423:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 427:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
 42b:	48 83 45 28 08       	addq   $0x8,0x28(%rbp)
 430:	8b 45 e0             	mov    -0x20(%rbp),%eax
 433:	3b 45 10             	cmp    0x10(%rbp),%eax
 436:	0f 8c 6c ff ff ff    	jl     3a8 <matrix_mult_ptr_no_reg+0x2f>
 43c:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
 440:	8b 45 10             	mov    0x10(%rbp),%eax
 443:	48 98                	cltq
 445:	48 c1 e0 03          	shl    $0x3,%rax
 449:	48 01 45 18          	add    %rax,0x18(%rbp)
 44d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 450:	3b 45 10             	cmp    0x10(%rbp),%eax
 453:	0f 8c 43 ff ff ff    	jl     39c <matrix_mult_ptr_no_reg+0x23>
 459:	90                   	nop
 45a:	90                   	nop
 45b:	48 83 c4 30          	add    $0x30,%rsp
 45f:	5d                   	pop    %rbp
 460:	c3                   	ret

0000000000000461 <main>:
 461:	55                   	push   %rbp
 462:	48 89 e5             	mov    %rsp,%rbp
 465:	48 83 ec 70          	sub    $0x70,%rsp
 469:	e8 00 00 00 00       	call   46e <main+0xd>
 46e:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 475 <main+0x14>
 475:	48 89 c1             	mov    %rax,%rcx
 478:	e8 d7 fb ff ff       	call   54 <printf>
 47d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
 481:	48 89 c2             	mov    %rax,%rdx
 484:	48 8d 05 1b 00 00 00 	lea    0x1b(%rip),%rax        # 4a6 <main+0x45>
 48b:	48 89 c1             	mov    %rax,%rcx
 48e:	e8 6d fb ff ff       	call   0 <scanf>
 493:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 49a:	8b 55 b8             	mov    -0x48(%rbp),%edx
 49d:	8b 45 b8             	mov    -0x48(%rbp),%eax
 4a0:	0f af c2             	imul   %edx,%eax
 4a3:	48 98                	cltq
 4a5:	48 c1 e0 03          	shl    $0x3,%rax
 4a9:	ba 40 00 00 00       	mov    $0x40,%edx
 4ae:	48 89 c1             	mov    %rax,%rcx
 4b1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4b8 <main+0x57>
 4b8:	ff d0                	call   *%rax
 4ba:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 4be:	8b 55 b8             	mov    -0x48(%rbp),%edx
 4c1:	8b 45 b8             	mov    -0x48(%rbp),%eax
 4c4:	0f af c2             	imul   %edx,%eax
 4c7:	48 98                	cltq
 4c9:	48 c1 e0 03          	shl    $0x3,%rax
 4cd:	ba 40 00 00 00       	mov    $0x40,%edx
 4d2:	48 89 c1             	mov    %rax,%rcx
 4d5:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4dc <main+0x7b>
 4dc:	ff d0                	call   *%rax
 4de:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 4e2:	8b 55 b8             	mov    -0x48(%rbp),%edx
 4e5:	8b 45 b8             	mov    -0x48(%rbp),%eax
 4e8:	0f af c2             	imul   %edx,%eax
 4eb:	48 98                	cltq
 4ed:	48 c1 e0 03          	shl    $0x3,%rax
 4f1:	ba 40 00 00 00       	mov    $0x40,%edx
 4f6:	48 89 c1             	mov    %rax,%rcx
 4f9:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 500 <main+0x9f>
 500:	ff d0                	call   *%rax
 502:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
 506:	8b 55 b8             	mov    -0x48(%rbp),%edx
 509:	8b 45 b8             	mov    -0x48(%rbp),%eax
 50c:	0f af c2             	imul   %edx,%eax
 50f:	48 98                	cltq
 511:	48 c1 e0 03          	shl    $0x3,%rax
 515:	ba 40 00 00 00       	mov    $0x40,%edx
 51a:	48 89 c1             	mov    %rax,%rcx
 51d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 524 <main+0xc3>
 524:	ff d0                	call   *%rax
 526:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
 52a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
 52f:	74 15                	je     546 <main+0xe5>
 531:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
 536:	74 0e                	je     546 <main+0xe5>
 538:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
 53d:	74 07                	je     546 <main+0xe5>
 53f:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
 544:	75 19                	jne    55f <main+0xfe>
 546:	48 8d 05 1e 00 00 00 	lea    0x1e(%rip),%rax        # 56b <main+0x10a>
 54d:	48 89 c1             	mov    %rax,%rcx
 550:	e8 ff fa ff ff       	call   54 <printf>
 555:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 55a:	e9 17 04 00 00       	jmp    976 <main+0x515>
 55f:	b9 00 00 00 00       	mov    $0x0,%ecx
 564:	e8 3f fb ff ff       	call   a8 <time>
 569:	89 45 c4             	mov    %eax,-0x3c(%rbp)
 56c:	8b 45 c4             	mov    -0x3c(%rbp),%eax
 56f:	89 c2                	mov    %eax,%edx
 571:	48 8d 05 38 00 00 00 	lea    0x38(%rip),%rax        # 5b0 <main+0x14f>
 578:	48 89 c1             	mov    %rax,%rcx
 57b:	e8 d4 fa ff ff       	call   54 <printf>
 580:	8b 45 c4             	mov    -0x3c(%rbp),%eax
 583:	89 c1                	mov    %eax,%ecx
 585:	e8 00 00 00 00       	call   58a <main+0x129>
 58a:	8b 55 b8             	mov    -0x48(%rbp),%edx
 58d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 591:	48 89 c1             	mov    %rax,%rcx
 594:	e8 31 fb ff ff       	call   ca <fill>
 599:	8b 55 b8             	mov    -0x48(%rbp),%edx
 59c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 5a0:	48 89 c1             	mov    %rax,%rcx
 5a3:	e8 22 fb ff ff       	call   ca <fill>
 5a8:	b9 00 00 00 00       	mov    $0x0,%ecx
 5ad:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 5b4 <main+0x153>
 5b4:	ff d0                	call   *%rax
 5b6:	48 89 c1             	mov    %rax,%rcx
 5b9:	e8 00 00 00 00       	call   5be <main+0x15d>
 5be:	48 8d 05 48 00 00 00 	lea    0x48(%rip),%rax        # 60d <main+0x1ac>
 5c5:	48 89 c1             	mov    %rax,%rcx
 5c8:	e8 87 fa ff ff       	call   54 <printf>
 5cd:	e8 00 00 00 00       	call   5d2 <main+0x171>
 5d2:	83 f8 79             	cmp    $0x79,%eax
 5d5:	75 74                	jne    64b <main+0x1ea>
 5d7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
 5de:	e8 00 00 00 00       	call   5e3 <main+0x182>
 5e3:	89 45 c0             	mov    %eax,-0x40(%rbp)
 5e6:	8b 45 b8             	mov    -0x48(%rbp),%eax
 5e9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
 5ed:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
 5f1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 5f5:	4d 89 c1             	mov    %r8,%r9
 5f8:	49 89 c8             	mov    %rcx,%r8
 5fb:	89 c1                	mov    %eax,%ecx
 5fd:	e8 8b fb ff ff       	call   18d <matrix_mult_index>
 602:	e8 00 00 00 00       	call   607 <main+0x1a6>
 607:	89 45 bc             	mov    %eax,-0x44(%rbp)
 60a:	8b 45 bc             	mov    -0x44(%rbp),%eax
 60d:	2b 45 c0             	sub    -0x40(%rbp),%eax
 610:	66 0f ef c0          	pxor   %xmm0,%xmm0
 614:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 618:	f3 0f 10 0d 6c 02 00 	movss  0x26c(%rip),%xmm1        # 88c <main+0x42b>
 61f:	00 
 620:	f3 0f 5e c1          	divss  %xmm1,%xmm0
 624:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
 628:	66 48 0f 7e c0       	movq   %xmm0,%rax
 62d:	48 89 c2             	mov    %rax,%rdx
 630:	66 48 0f 6e c2       	movq   %rdx,%xmm0
 635:	66 0f 28 c8          	movapd %xmm0,%xmm1
 639:	48 89 c2             	mov    %rax,%rdx
 63c:	48 8d 05 78 00 00 00 	lea    0x78(%rip),%rax        # 6bb <main+0x25a>
 643:	48 89 c1             	mov    %rax,%rcx
 646:	e8 09 fa ff ff       	call   54 <printf>
 64b:	b9 00 00 00 00       	mov    $0x0,%ecx
 650:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 657 <main+0x1f6>
 657:	ff d0                	call   *%rax
 659:	48 89 c1             	mov    %rax,%rcx
 65c:	e8 00 00 00 00       	call   661 <main+0x200>
 661:	48 8d 05 b0 00 00 00 	lea    0xb0(%rip),%rax        # 718 <main+0x2b7>
 668:	48 89 c1             	mov    %rax,%rcx
 66b:	e8 e4 f9 ff ff       	call   54 <printf>
 670:	e8 00 00 00 00       	call   675 <main+0x214>
 675:	83 f8 79             	cmp    $0x79,%eax
 678:	75 78                	jne    6f2 <main+0x291>
 67a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 67e:	e8 00 00 00 00       	call   683 <main+0x222>
 683:	89 45 c0             	mov    %eax,-0x40(%rbp)
 686:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 68a:	75 06                	jne    692 <main+0x231>
 68c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 690:	eb 04                	jmp    696 <main+0x235>
 692:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 696:	8b 4d b8             	mov    -0x48(%rbp),%ecx
 699:	4c 8b 45 d8          	mov    -0x28(%rbp),%r8
 69d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 6a1:	49 89 c1             	mov    %rax,%r9
 6a4:	e8 12 fc ff ff       	call   2bb <matrix_mult_ptr_reg>
 6a9:	e8 00 00 00 00       	call   6ae <main+0x24d>
 6ae:	89 45 bc             	mov    %eax,-0x44(%rbp)
 6b1:	8b 45 bc             	mov    -0x44(%rbp),%eax
 6b4:	2b 45 c0             	sub    -0x40(%rbp),%eax
 6b7:	66 0f ef c0          	pxor   %xmm0,%xmm0
 6bb:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 6bf:	f3 0f 10 0d 6c 02 00 	movss  0x26c(%rip),%xmm1        # 933 <main+0x4d2>
 6c6:	00 
 6c7:	f3 0f 5e c1          	divss  %xmm1,%xmm0
 6cb:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
 6cf:	66 48 0f 7e c0       	movq   %xmm0,%rax
 6d4:	48 89 c2             	mov    %rax,%rdx
 6d7:	66 48 0f 6e c2       	movq   %rdx,%xmm0
 6dc:	66 0f 28 c8          	movapd %xmm0,%xmm1
 6e0:	48 89 c2             	mov    %rax,%rdx
 6e3:	48 8d 05 e8 00 00 00 	lea    0xe8(%rip),%rax        # 7d2 <main+0x371>
 6ea:	48 89 c1             	mov    %rax,%rcx
 6ed:	e8 62 f9 ff ff       	call   54 <printf>
 6f2:	b9 00 00 00 00       	mov    $0x0,%ecx
 6f7:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 6fe <main+0x29d>
 6fe:	ff d0                	call   *%rax
 700:	48 89 c1             	mov    %rax,%rcx
 703:	e8 00 00 00 00       	call   708 <main+0x2a7>
 708:	48 8d 05 20 01 00 00 	lea    0x120(%rip),%rax        # 82f <main+0x3ce>
 70f:	48 89 c1             	mov    %rax,%rcx
 712:	e8 3d f9 ff ff       	call   54 <printf>
 717:	e8 00 00 00 00       	call   71c <main+0x2bb>
 71c:	83 f8 79             	cmp    $0x79,%eax
 71f:	0f 85 85 00 00 00    	jne    7aa <main+0x349>
 725:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 729:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
 72d:	7e 07                	jle    736 <main+0x2d5>
 72f:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
 736:	e8 00 00 00 00       	call   73b <main+0x2da>
 73b:	89 45 c0             	mov    %eax,-0x40(%rbp)
 73e:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 742:	75 06                	jne    74a <main+0x2e9>
 744:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 748:	eb 04                	jmp    74e <main+0x2ed>
 74a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 74e:	8b 4d b8             	mov    -0x48(%rbp),%ecx
 751:	4c 8b 45 d8          	mov    -0x28(%rbp),%r8
 755:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 759:	49 89 c1             	mov    %rax,%r9
 75c:	e8 18 fc ff ff       	call   379 <matrix_mult_ptr_no_reg>
 761:	e8 00 00 00 00       	call   766 <main+0x305>
 766:	89 45 bc             	mov    %eax,-0x44(%rbp)
 769:	8b 45 bc             	mov    -0x44(%rbp),%eax
 76c:	2b 45 c0             	sub    -0x40(%rbp),%eax
 76f:	66 0f ef c0          	pxor   %xmm0,%xmm0
 773:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 777:	f3 0f 10 0d 6c 02 00 	movss  0x26c(%rip),%xmm1        # 9eb <main+0x58a>
 77e:	00 
 77f:	f3 0f 5e c1          	divss  %xmm1,%xmm0
 783:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
 787:	66 48 0f 7e c0       	movq   %xmm0,%rax
 78c:	48 89 c2             	mov    %rax,%rdx
 78f:	66 48 0f 6e c2       	movq   %rdx,%xmm0
 794:	66 0f 28 c8          	movapd %xmm0,%xmm1
 798:	48 89 c2             	mov    %rax,%rdx
 79b:	48 8d 05 58 01 00 00 	lea    0x158(%rip),%rax        # 8fa <main+0x499>
 7a2:	48 89 c1             	mov    %rax,%rcx
 7a5:	e8 aa f8 ff ff       	call   54 <printf>
 7aa:	48 8d 05 8f 01 00 00 	lea    0x18f(%rip),%rax        # 940 <main+0x4df>
 7b1:	48 89 c1             	mov    %rax,%rcx
 7b4:	e8 9b f8 ff ff       	call   54 <printf>
 7b9:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
 7bd:	0f 85 2c 01 00 00    	jne    8ef <main+0x48e>
 7c3:	48 8d 05 a5 01 00 00 	lea    0x1a5(%rip),%rax        # 96f <main+0x50e>
 7ca:	48 89 c1             	mov    %rax,%rcx
 7cd:	e8 82 f8 ff ff       	call   54 <printf>
 7d2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 7d9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 7dd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 7e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 7e5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 7e9:	8b 55 b8             	mov    -0x48(%rbp),%edx
 7ec:	8b 45 b8             	mov    -0x48(%rbp),%eax
 7ef:	0f af c2             	imul   %edx,%eax
 7f2:	89 45 b8             	mov    %eax,-0x48(%rbp)
 7f5:	eb 7c                	jmp    873 <main+0x412>
 7f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 7fb:	f2 0f 10 00          	movsd  (%rax),%xmm0
 7ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 803:	f2 0f 10 08          	movsd  (%rax),%xmm1
 807:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
 80b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 80f:	f2 0f 10 08          	movsd  (%rax),%xmm1
 813:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
 817:	f3 0f 7e 0d 70 02 00 	movq   0x270(%rip),%xmm1        # a8f <main+0x62e>
 81e:	00 
 81f:	66 0f 54 c1          	andpd  %xmm1,%xmm0
 823:	66 0f 2f 05 80 02 00 	comisd 0x280(%rip),%xmm0        # aab <main+0x64a>
 82a:	00 
 82b:	77 54                	ja     881 <main+0x420>
 82d:	8b 45 b8             	mov    -0x48(%rbp),%eax
 830:	48 63 d0             	movslq %eax,%rdx
 833:	48 69 d2 67 66 66 66 	imul   $0x66666667,%rdx,%rdx
 83a:	48 c1 ea 20          	shr    $0x20,%rdx
 83e:	c1 fa 03             	sar    $0x3,%edx
 841:	c1 f8 1f             	sar    $0x1f,%eax
 844:	89 d1                	mov    %edx,%ecx
 846:	29 c1                	sub    %eax,%ecx
 848:	8b 45 f8             	mov    -0x8(%rbp),%eax
 84b:	99                   	cltd
 84c:	f7 f9                	idiv   %ecx
 84e:	89 d1                	mov    %edx,%ecx
 850:	89 c8                	mov    %ecx,%eax
 852:	85 c0                	test   %eax,%eax
 854:	75 0f                	jne    865 <main+0x404>
 856:	48 8d 05 ba 01 00 00 	lea    0x1ba(%rip),%rax        # a17 <main+0x5b6>
 85d:	48 89 c1             	mov    %rax,%rcx
 860:	e8 ef f7 ff ff       	call   54 <printf>
 865:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 869:	48 83 45 f0 08       	addq   $0x8,-0x10(%rbp)
 86e:	48 83 45 e8 08       	addq   $0x8,-0x18(%rbp)
 873:	8b 45 b8             	mov    -0x48(%rbp),%eax
 876:	39 45 f8             	cmp    %eax,-0x8(%rbp)
 879:	0f 8c 78 ff ff ff    	jl     7f7 <main+0x396>
 87f:	eb 01                	jmp    882 <main+0x421>
 881:	90                   	nop
 882:	8b 45 b8             	mov    -0x48(%rbp),%eax
 885:	39 45 f8             	cmp    %eax,-0x8(%rbp)
 888:	74 54                	je     8de <main+0x47d>
 88a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 88e:	f2 0f 10 08          	movsd  (%rax),%xmm1
 892:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 896:	f2 0f 10 00          	movsd  (%rax),%xmm0
 89a:	66 48 0f 7e c8       	movq   %xmm1,%rax
 89f:	48 89 c2             	mov    %rax,%rdx
 8a2:	66 48 0f 6e ca       	movq   %rdx,%xmm1
 8a7:	48 89 c1             	mov    %rax,%rcx
 8aa:	66 48 0f 7e c0       	movq   %xmm0,%rax
 8af:	48 89 c2             	mov    %rax,%rdx
 8b2:	66 48 0f 6e c2       	movq   %rdx,%xmm0
 8b7:	48 89 c2             	mov    %rax,%rdx
 8ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
 8bd:	66 0f 28 d9          	movapd %xmm1,%xmm3
 8c1:	49 89 c9             	mov    %rcx,%r9
 8c4:	66 0f 28 d0          	movapd %xmm0,%xmm2
 8c8:	49 89 d0             	mov    %rdx,%r8
 8cb:	89 c2                	mov    %eax,%edx
 8cd:	48 8d 05 c0 01 00 00 	lea    0x1c0(%rip),%rax        # a94 <main+0x633>
 8d4:	48 89 c1             	mov    %rax,%rcx
 8d7:	e8 78 f7 ff ff       	call   54 <printf>
 8dc:	eb 20                	jmp    8fe <main+0x49d>
 8de:	48 8d 05 f0 01 00 00 	lea    0x1f0(%rip),%rax        # ad5 <main+0x674>
 8e5:	48 89 c1             	mov    %rax,%rcx
 8e8:	e8 67 f7 ff ff       	call   54 <printf>
 8ed:	eb 0f                	jmp    8fe <main+0x49d>
 8ef:	48 8d 05 18 02 00 00 	lea    0x218(%rip),%rax        # b0e <main+0x6ad>
 8f6:	48 89 c1             	mov    %rax,%rcx
 8f9:	e8 56 f7 ff ff       	call   54 <printf>
 8fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 902:	48 89 c1             	mov    %rax,%rcx
 905:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 90c <main+0x4ab>
 90c:	ff d0                	call   *%rax
 90e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 912:	48 89 c1             	mov    %rax,%rcx
 915:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 91c <main+0x4bb>
 91c:	ff d0                	call   *%rax
 91e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 922:	48 89 c1             	mov    %rax,%rcx
 925:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 92c <main+0x4cb>
 92c:	ff d0                	call   *%rax
 92e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 932:	48 89 c1             	mov    %rax,%rcx
 935:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 93c <main+0x4db>
 93c:	ff d0                	call   *%rax
 93e:	b9 00 00 00 00       	mov    $0x0,%ecx
 943:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 94a <main+0x4e9>
 94a:	ff d0                	call   *%rax
 94c:	48 89 c1             	mov    %rax,%rcx
 94f:	e8 00 00 00 00       	call   954 <main+0x4f3>
 954:	48 8d 05 48 02 00 00 	lea    0x248(%rip),%rax        # ba3 <main+0x742>
 95b:	48 89 c1             	mov    %rax,%rcx
 95e:	e8 f1 f6 ff ff       	call   54 <printf>
 963:	e8 00 00 00 00       	call   968 <main+0x507>
 968:	83 f8 79             	cmp    $0x79,%eax
 96b:	0f 84 fd fa ff ff    	je     46e <main+0xd>
 971:	b8 00 00 00 00       	mov    $0x0,%eax
 976:	48 83 c4 70          	add    $0x70,%rsp
 97a:	5d                   	pop    %rbp
 97b:	c3                   	ret
 97c:	90                   	nop
 97d:	90                   	nop
 97e:	90                   	nop
 97f:	90                   	nop

Disassembly of section .xdata:

0000000000000000 <.xdata>:
   0:	01 0b                	add    %ecx,(%rbx)
   2:	04 35                	add    $0x35,%al
   4:	0b 03                	or     (%rbx),%eax
   6:	06                   	(bad)
   7:	62 02 30 01 50 01    	vpdpbuud (%r9),%xmm25,%xmm24{%k1}
   d:	0b 04 35 0b 03 06 62 	or     0x6206030b(,%rsi,1),%eax
  14:	02 30                	add    (%rax),%dh
  16:	01 50 01             	add    %edx,0x1(%rax)
  19:	08 03                	or     %al,(%rbx)
  1b:	05 08 32 04 03       	add    $0x3043208,%eax
  20:	01 50 00             	add    %edx,0x0(%rax)
  23:	00 01                	add    %al,(%rcx)
  25:	0e                   	(bad)
  26:	05 35 0e 68 03       	add    $0x3680e35,%eax
  2b:	00 0a                	add    %cl,(%rdx)
  2d:	03 05 72 01 50 00    	add    0x500172(%rip),%eax        # 5001a5 <main+0x4ffd44>
  33:	00 01                	add    %al,(%rcx)
  35:	08 03                	or     %al,(%rbx)
  37:	05 08 12 04 03       	add    $0x3041208,%eax
  3c:	01 50 00             	add    %edx,0x0(%rax)
  3f:	00 01                	add    %al,(%rcx)
  41:	14 0a                	adc    $0xa,%al
  43:	05 14 68 00 00       	add    $0x6814,%eax
  48:	10 03                	adc    %al,(%rbx)
  4a:	0c 22                	or     $0x22,%al
  4c:	08 30                	or     %dh,(%rax)
  4e:	07                   	(bad)
  4f:	60                   	(bad)
  50:	06                   	(bad)
  51:	70 05                	jo     58 <.xdata+0x58>
  53:	c0 03 d0             	rolb   $0xd0,(%rbx)
  56:	01 50 01             	add    %edx,0x1(%rax)
  59:	08 03                	or     %al,(%rbx)
  5b:	05 08 52 04 03       	add    $0x3045208,%eax
  60:	01 50 00             	add    %edx,0x0(%rax)
  63:	00 01                	add    %al,(%rcx)
  65:	08 03                	or     %al,(%rbx)
  67:	05 08 d2 04 03       	add    $0x304d208,%eax
  6c:	01 50 00             	add    %edx,0x0(%rax)
	...

Disassembly of section .pdata:

0000000000000000 <.pdata>:
   0:	00 00                	add    %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	54                   	push   %rsp
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	00 00                	add    %al,(%rax)
   b:	00 54 00 00          	add    %dl,0x0(%rax,%rax,1)
   f:	00 a8 00 00 00 0c    	add    %ch,0xc000000(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 a8 00 00 00 ca    	add    %ch,-0x36000000(%rax)
  1d:	00 00                	add    %al,(%rax)
  1f:	00 18                	add    %bl,(%rax)
  21:	00 00                	add    %al,(%rax)
  23:	00 ca                	add    %cl,%dl
  25:	00 00                	add    %al,(%rax)
  27:	00 8d 01 00 00 24    	add    %cl,0x24000001(%rbp)
  2d:	00 00                	add    %al,(%rax)
  2f:	00 8d 01 00 00 bb    	add    %cl,-0x44ffffff(%rbp)
  35:	02 00                	add    (%rax),%al
  37:	00 34 00             	add    %dh,(%rax,%rax,1)
  3a:	00 00                	add    %al,(%rax)
  3c:	bb 02 00 00 79       	mov    $0x79000002,%ebx
  41:	03 00                	add    (%rax),%eax
  43:	00 40 00             	add    %al,0x0(%rax)
  46:	00 00                	add    %al,(%rax)
  48:	79 03                	jns    4d <.pdata+0x4d>
  4a:	00 00                	add    %al,(%rax)
  4c:	61                   	(bad)
  4d:	04 00                	add    $0x0,%al
  4f:	00 58 00             	add    %bl,0x0(%rax)
  52:	00 00                	add    %al,(%rax)
  54:	61                   	(bad)
  55:	04 00                	add    $0x0,%al
  57:	00 7c 09 00          	add    %bh,0x0(%rcx,%rcx,1)
  5b:	00 64 00 00          	add    %ah,0x0(%rax,%rax,1)
	...

Disassembly of section .rdata:

0000000000000000 <.rdata>:
   0:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
   2:	70 75                	jo     79 <.rdata+0x79>
   4:	74 20                	je     26 <.rdata+0x26>
   6:	73 69                	jae    71 <.rdata+0x71>
   8:	7a 65                	jp     6f <.rdata+0x6f>
   a:	20 6f 66             	and    %ch,0x66(%rdi)
   d:	20 6d 61             	and    %ch,0x61(%rbp)
  10:	74 72                	je     84 <.rdata+0x84>
  12:	69 78 2c 20 6e 20 3d 	imul   $0x3d206e20,0x2c(%rax),%edi
  19:	20 00                	and    %al,(%rax)
  1b:	25 64 00 4d 65       	and    $0x654d0064,%eax
  20:	6d                   	insl   (%dx),%es:(%rdi)
  21:	6f                   	outsl  %ds:(%rsi),(%dx)
  22:	72 79                	jb     9d <.rdata+0x9d>
  24:	20 41 6c             	and    %al,0x6c(%rcx)
  27:	6c                   	insb   (%dx),%es:(%rdi)
  28:	6f                   	outsl  %ds:(%rsi),(%dx)
  29:	63 61 74             	movsxd 0x74(%rcx),%esp
  2c:	69 6f 6e 20 45 72 72 	imul   $0x72724520,0x6e(%rdi),%ebp
  33:	6f                   	outsl  %ds:(%rsi),(%dx)
  34:	72 0a                	jb     40 <.rdata+0x40>
  36:	0a 00                	or     (%rax),%al
  38:	0a 73 65             	or     0x65(%rbx),%dh
  3b:	65 64 20 3d 20 25 75 	gs and %bh,%fs:0xa752520(%rip)        # a752563 <main+0xa752102>
  42:	0a 
  43:	00 00                	add    %al,(%rax)
  45:	00 00                	add    %al,(%rax)
  47:	00 0a                	add    %cl,(%rdx)
  49:	0a 44 6f 20          	or     0x20(%rdi,%rbp,2),%al
  4d:	79 6f                	jns    be <.rdata+0xbe>
  4f:	75 20                	jne    71 <.rdata+0x71>
  51:	77 61                	ja     b4 <.rdata+0xb4>
  53:	6e                   	outsb  %ds:(%rsi),(%dx)
  54:	74 20                	je     76 <.rdata+0x76>
  56:	74 6f                	je     c7 <.rdata+0xc7>
  58:	20 72 75             	and    %dh,0x75(%rdx)
  5b:	6e                   	outsb  %ds:(%rsi),(%dx)
  5c:	20 6d 61             	and    %ch,0x61(%rbp)
  5f:	74 72                	je     d3 <.rdata+0xd3>
  61:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
  68:	5f                   	pop    %rdi
  69:	69 6e 64 65 78 20 28 	imul   $0x28207865,0x64(%rsi),%ebp
  70:	79 2f                	jns    a1 <.rdata+0xa1>
  72:	6e                   	outsb  %ds:(%rsi),(%dx)
  73:	29 3f                	sub    %edi,(%rdi)
  75:	20 00                	and    %al,(%rax)
  77:	00 0a                	add    %cl,(%rdx)
  79:	09 09                	or     %ecx,(%rcx)
  7b:	09 45 78             	or     %eax,0x78(%rbp)
  7e:	65 63 75 74          	movsxd %gs:0x74(%rbp),%esi
  82:	69 6f 6e 20 74 69 6d 	imul   $0x6d697420,0x6e(%rdi),%ebp
  89:	65 20 6f 66          	and    %ch,%gs:0x66(%rdi)
  8d:	20 6d 61             	and    %ch,0x61(%rbp)
  90:	74 72                	je     104 <.rdata+0x104>
  92:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
  99:	5f                   	pop    %rdi
  9a:	69 6e 64 65 78 20 3d 	imul   $0x3d207865,0x64(%rsi),%ebp
  a1:	20 25 30 2e 32 66    	and    %ah,0x66322e30(%rip)        # 66322ed7 <main+0x66322a76>
  a7:	20 73 00             	and    %dh,0x0(%rbx)
  aa:	00 00                	add    %al,(%rax)
  ac:	00 00                	add    %al,(%rax)
  ae:	00 00                	add    %al,(%rax)
  b0:	0a 0a                	or     (%rdx),%cl
  b2:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
  b4:	20 79 6f             	and    %bh,0x6f(%rcx)
  b7:	75 20                	jne    d9 <.rdata+0xd9>
  b9:	77 61                	ja     11c <.rdata+0x11c>
  bb:	6e                   	outsb  %ds:(%rsi),(%dx)
  bc:	74 20                	je     de <.rdata+0xde>
  be:	74 6f                	je     12f <.rdata+0x12f>
  c0:	20 72 75             	and    %dh,0x75(%rdx)
  c3:	6e                   	outsb  %ds:(%rsi),(%dx)
  c4:	20 6d 61             	and    %ch,0x61(%rbp)
  c7:	74 72                	je     13b <.rdata+0x13b>
  c9:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
  d0:	5f                   	pop    %rdi
  d1:	70 74                	jo     147 <.rdata+0x147>
  d3:	72 5f                	jb     134 <.rdata+0x134>
  d5:	72 65                	jb     13c <.rdata+0x13c>
  d7:	67 20 28             	and    %ch,(%eax)
  da:	79 2f                	jns    10b <.rdata+0x10b>
  dc:	6e                   	outsb  %ds:(%rsi),(%dx)
  dd:	29 3f                	sub    %edi,(%rdi)
  df:	20 00                	and    %al,(%rax)
  e1:	00 00                	add    %al,(%rax)
  e3:	00 00                	add    %al,(%rax)
  e5:	00 00                	add    %al,(%rax)
  e7:	00 0a                	add    %cl,(%rdx)
  e9:	09 09                	or     %ecx,(%rcx)
  eb:	09 45 78             	or     %eax,0x78(%rbp)
  ee:	65 63 75 74          	movsxd %gs:0x74(%rbp),%esi
  f2:	69 6f 6e 20 74 69 6d 	imul   $0x6d697420,0x6e(%rdi),%ebp
  f9:	65 20 6f 66          	and    %ch,%gs:0x66(%rdi)
  fd:	20 6d 61             	and    %ch,0x61(%rbp)
 100:	74 72                	je     174 <.rdata+0x174>
 102:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
 109:	5f                   	pop    %rdi
 10a:	70 74                	jo     180 <.rdata+0x180>
 10c:	72 5f                	jb     16d <.rdata+0x16d>
 10e:	72 65                	jb     175 <.rdata+0x175>
 110:	67 20 3d 20 25 30 2e 	and    %bh,0x2e302520(%eip)        # 2e302637 <main+0x2e3021d6>
 117:	32 66 20             	xor    0x20(%rsi),%ah
 11a:	73 0a                	jae    126 <.rdata+0x126>
 11c:	00 00                	add    %al,(%rax)
 11e:	00 00                	add    %al,(%rax)
 120:	0a 0a                	or     (%rdx),%cl
 122:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
 124:	20 79 6f             	and    %bh,0x6f(%rcx)
 127:	75 20                	jne    149 <.rdata+0x149>
 129:	77 61                	ja     18c <.rdata+0x18c>
 12b:	6e                   	outsb  %ds:(%rsi),(%dx)
 12c:	74 20                	je     14e <.rdata+0x14e>
 12e:	74 6f                	je     19f <.rdata+0x19f>
 130:	20 72 75             	and    %dh,0x75(%rdx)
 133:	6e                   	outsb  %ds:(%rsi),(%dx)
 134:	20 6d 61             	and    %ch,0x61(%rbp)
 137:	74 72                	je     1ab <.rdata+0x1ab>
 139:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
 140:	5f                   	pop    %rdi
 141:	70 74                	jo     1b7 <.rdata+0x1b7>
 143:	72 5f                	jb     1a4 <.rdata+0x1a4>
 145:	6e                   	outsb  %ds:(%rsi),(%dx)
 146:	6f                   	outsl  %ds:(%rsi),(%dx)
 147:	5f                   	pop    %rdi
 148:	72 65                	jb     1af <.rdata+0x1af>
 14a:	67 20 28             	and    %ch,(%eax)
 14d:	79 2f                	jns    17e <.rdata+0x17e>
 14f:	6e                   	outsb  %ds:(%rsi),(%dx)
 150:	29 3f                	sub    %edi,(%rdi)
 152:	20 00                	and    %al,(%rax)
 154:	00 00                	add    %al,(%rax)
 156:	00 00                	add    %al,(%rax)
 158:	0a 09                	or     (%rcx),%cl
 15a:	09 09                	or     %ecx,(%rcx)
 15c:	45 78 65             	rex.RB js 1c4 <.rdata+0x1c4>
 15f:	63 75 74             	movsxd 0x74(%rbp),%esi
 162:	69 6f 6e 20 74 69 6d 	imul   $0x6d697420,0x6e(%rdi),%ebp
 169:	65 20 6f 66          	and    %ch,%gs:0x66(%rdi)
 16d:	20 6d 61             	and    %ch,0x61(%rbp)
 170:	74 72                	je     1e4 <.rdata+0x1e4>
 172:	69 78 5f 6d 75 6c 74 	imul   $0x746c756d,0x5f(%rax),%edi
 179:	5f                   	pop    %rdi
 17a:	70 74                	jo     1f0 <.rdata+0x1f0>
 17c:	72 5f                	jb     1dd <.rdata+0x1dd>
 17e:	6e                   	outsb  %ds:(%rsi),(%dx)
 17f:	6f                   	outsl  %ds:(%rsi),(%dx)
 180:	5f                   	pop    %rdi
 181:	72 65                	jb     1e8 <.rdata+0x1e8>
 183:	67 20 3d 20 25 30 2e 	and    %bh,0x2e302520(%eip)        # 2e3026aa <main+0x2e302249>
 18a:	32 66 20             	xor    0x20(%rsi),%ah
 18d:	73 00                	jae    18f <.rdata+0x18f>
 18f:	0a 0a                	or     (%rdx),%cl
 191:	0a 45 6e             	or     0x6e(%rbp),%al
 194:	64 20 4f 66          	and    %cl,%fs:0x66(%rdi)
 198:	20 45 78             	and    %al,0x78(%rbp)
 19b:	65 63 75 74          	movsxd %gs:0x74(%rbp),%esi
 19f:	69 6f 6e 0a 0a 00 0a 	imul   $0xa000a0a,0x6e(%rdi),%ebp
 1a6:	0a 53 74             	or     0x74(%rbx),%dl
 1a9:	61                   	(bad)
 1aa:	72 74                	jb     220 <.rdata+0x220>
 1ac:	20 6f 66             	and    %ch,0x66(%rdi)
 1af:	20 43 6f             	and    %al,0x6f(%rbx)
 1b2:	6d                   	insl   (%dx),%es:(%rdi)
 1b3:	70 61                	jo     216 <.rdata+0x216>
 1b5:	72 65                	jb     21c <.rdata+0x21c>
 1b7:	3a 20                	cmp    (%rax),%ah
 1b9:	00 2e                	add    %ch,(%rsi)
 1bb:	00 00                	add    %al,(%rax)
 1bd:	00 00                	add    %al,(%rax)
 1bf:	00 20                	add    %ah,(%rax)
 1c1:	4f 6f                	rex.WRXB outsl %ds:(%rsi),(%dx)
 1c3:	6f                   	outsl  %ds:(%rsi),(%dx)
 1c4:	70 73                	jo     239 <.rdata+0x239>
 1c6:	2c 20                	sub    $0x20,%al
 1c8:	45 72 72             	rex.RB jb 23d <.rdata+0x23d>
 1cb:	6f                   	outsl  %ds:(%rsi),(%dx)
 1cc:	72 20                	jb     1ee <.rdata+0x1ee>
 1ce:	46 6f                	rex.RX outsl %ds:(%rsi),(%dx)
 1d0:	75 6e                	jne    240 <.rdata+0x240>
 1d2:	64 20 40 20          	and    %al,%fs:0x20(%rax)
 1d6:	25 64 3a 20 25       	and    $0x25203a64,%eax
 1db:	30 2e                	xor    %ch,(%rsi)
 1dd:	33 66 20             	xor    0x20(%rsi),%esp
 1e0:	76 73                	jbe    255 <.rdata+0x255>
 1e2:	20 25 30 2e 33 66    	and    %ah,0x66332e30(%rip)        # 66333018 <main+0x66332bb7>
 1e8:	0a 0a                	or     (%rdx),%cl
 1ea:	00 00                	add    %al,(%rax)
 1ec:	00 00                	add    %al,(%rax)
 1ee:	00 00                	add    %al,(%rax)
 1f0:	20 4f 4b             	and    %cl,0x4b(%rdi)
 1f3:	2c 20                	sub    $0x20,%al
 1f5:	4f                   	rex.WRXB
 1f6:	4b 2c 20             	rex.WXB sub $0x20,%al
 1f9:	4d 61                	rex.WRB (bad)
 1fb:	74 72                	je     26f <.rdata+0x26f>
 1fd:	69 78 65 73 20 61 72 	imul   $0x72612073,0x65(%rax),%edi
 204:	65 20 65 71          	and    %ah,%gs:0x71(%rbp)
 208:	75 69                	jne    273 <.rdata+0x273>
 20a:	76 61                	jbe    26d <.rdata+0x26d>
 20c:	6c                   	insb   (%dx),%es:(%rdi)
 20d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 20f:	74 2e                	je     23f <.rdata+0x23f>
 211:	0a 0a                	or     (%rdx),%cl
 213:	00 00                	add    %al,(%rax)
 215:	00 00                	add    %al,(%rax)
 217:	00 0a                	add    %cl,(%rdx)
 219:	0a 4e 6f             	or     0x6f(%rsi),%cl
 21c:	20 43 6f             	and    %al,0x6f(%rbx)
 21f:	6d                   	insl   (%dx),%es:(%rdi)
 220:	70 61                	jo     283 <.rdata+0x283>
 222:	72 65                	jb     289 <.rdata+0x289>
 224:	20 64 75 65          	and    %ah,0x65(%rbp,%rsi,2)
 228:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 22c:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
 22e:	20 52 65             	and    %dl,0x65(%rdx)
 231:	66 65 72 65          	data16 gs jb 29a <matrix_mult_index+0x10d>
 235:	6e                   	outsb  %ds:(%rsi),(%dx)
 236:	63 65 20             	movsxd 0x20(%rbp),%esp
 239:	6f                   	outsl  %ds:(%rsi),(%dx)
 23a:	72 20                	jb     25c <.rdata+0x25c>
 23c:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
 23e:	20 44 61 74          	and    %al,0x74(%rcx,%riz,2)
 242:	61                   	(bad)
 243:	2e 0a 0a             	cs or  (%rdx),%cl
 246:	00 00                	add    %al,(%rax)
 248:	0a 0a                	or     (%rdx),%cl
 24a:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
 24c:	20 79 6f             	and    %bh,0x6f(%rcx)
 24f:	75 20                	jne    271 <.rdata+0x271>
 251:	77 61                	ja     2b4 <matrix_mult_index+0x127>
 253:	6e                   	outsb  %ds:(%rsi),(%dx)
 254:	74 20                	je     276 <.rdata+0x276>
 256:	74 6f                	je     2c7 <matrix_mult_ptr_reg+0xc>
 258:	20 63 6f             	and    %ah,0x6f(%rbx)
 25b:	6e                   	outsb  %ds:(%rsi),(%dx)
 25c:	74 69                	je     2c7 <matrix_mult_ptr_reg+0xc>
 25e:	6e                   	outsb  %ds:(%rsi),(%dx)
 25f:	75 65                	jne    2c6 <matrix_mult_ptr_reg+0xb>
 261:	20 28                	and    %ch,(%rax)
 263:	79 2f                	jns    294 <matrix_mult_index+0x107>
 265:	6e                   	outsb  %ds:(%rsi),(%dx)
 266:	29 3f                	sub    %edi,(%rdi)
 268:	20 00                	and    %al,(%rax)
 26a:	00 00                	add    %al,(%rax)
 26c:	00 00                	add    %al,(%rax)
 26e:	7a 44                	jp     2b4 <matrix_mult_index+0x127>
 270:	ff                   	(bad)
 271:	ff                   	(bad)
 272:	ff                   	(bad)
 273:	ff                   	(bad)
 274:	ff                   	(bad)
 275:	ff                   	(bad)
 276:	ff                   	(bad)
 277:	7f 00                	jg     279 <.rdata+0x279>
 279:	00 00                	add    %al,(%rax)
 27b:	00 00                	add    %al,(%rax)
 27d:	00 00                	add    %al,(%rax)
 27f:	00 bb bd d7 d9 df    	add    %bh,-0x20262843(%rbx)
 285:	7c db                	jl     262 <.rdata+0x262>
 287:	3d 00 00 00 00       	cmp    $0x0,%eax
 28c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rdata$zzz:

0000000000000000 <.rdata$zzz>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 52 65             	sub    %dl,0x65(%rdx)
   8:	76 34                	jbe    3e <.rdata$zzz+0x3e>
   a:	2c 20                	sub    $0x20,%al
   c:	42 75 69             	rex.X jne 78 <printf+0x24>
   f:	6c                   	insb   (%dx),%es:(%rdi)
  10:	74 20                	je     32 <.rdata$zzz+0x32>
  12:	62 79 20 4d 53       	(bad)
  17:	59                   	pop    %rcx
  18:	53                   	push   %rbx
  19:	32 20                	xor    (%rax),%ah
  1b:	70 72                	jo     8f <printf+0x3b>
  1d:	6f                   	outsl  %ds:(%rsi),(%dx)
  1e:	6a 65                	push   $0x65
  20:	63 74 29 20          	movsxd 0x20(%rcx,%rbp,1),%esi
  24:	31 33                	xor    %esi,(%rbx)
  26:	2e 32 2e             	cs xor (%rsi),%ch
  29:	30 00                	xor    %al,(%rax)
  2b:	00 00                	add    %al,(%rax)
  2d:	00 00                	add    %al,(%rax)
	...
