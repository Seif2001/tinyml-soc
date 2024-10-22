
multiply.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00000093          	li	ra,0
   4:	20002117          	auipc	sp,0x20002
   8:	ffc10113          	addi	sp,sp,-4 # 20002000 <_stack>
   c:	00000193          	li	gp,0
  10:	00000213          	li	tp,0
  14:	00000293          	li	t0,0
  18:	00000313          	li	t1,0
  1c:	00000393          	li	t2,0
  20:	00000413          	li	s0,0
  24:	00000493          	li	s1,0
  28:	00000513          	li	a0,0
  2c:	00000593          	li	a1,0
  30:	00000613          	li	a2,0
  34:	00000693          	li	a3,0
  38:	00000713          	li	a4,0
  3c:	00000793          	li	a5,0
  40:	00000813          	li	a6,0
  44:	00000893          	li	a7,0
  48:	00000913          	li	s2,0
  4c:	00000993          	li	s3,0
  50:	00000a13          	li	s4,0
  54:	00000a93          	li	s5,0
  58:	00000b13          	li	s6,0
  5c:	00000b93          	li	s7,0
  60:	00000c13          	li	s8,0
  64:	00000c93          	li	s9,0
  68:	00000d13          	li	s10,0
  6c:	00000d93          	li	s11,0
  70:	00000e13          	li	t3,0
  74:	00000e93          	li	t4,0
  78:	00000f13          	li	t5,0
  7c:	00000f93          	li	t6,0
  80:	00000517          	auipc	a0,0x0
  84:	4c450513          	addi	a0,a0,1220 # 544 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <uart_ctrl>
  90:	20000617          	auipc	a2,0x20000
  94:	f8060613          	addi	a2,a2,-128 # 20000010 <timer>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f6050513          	addi	a0,a0,-160 # 20000010 <timer>
  b8:	81818593          	addi	a1,gp,-2024 # 20000028 <_ebss>
  bc:	00b55863          	bge	a0,a1,cc <end_init_bss>

000000c0 <loop_init_bss>:
  c0:	00052023          	sw	zero,0(a0)
  c4:	00450513          	addi	a0,a0,4
  c8:	feb54ce3          	blt	a0,a1,c0 <loop_init_bss>

000000cc <end_init_bss>:
  cc:	06c000ef          	jal	138 <main>

000000d0 <loopy>:
  d0:	0000006f          	j	d0 <loopy>

000000d4 <__mulsi3>:
  d4:	fd010113          	addi	sp,sp,-48
  d8:	02812623          	sw	s0,44(sp)
  dc:	03010413          	addi	s0,sp,48
  e0:	fca42e23          	sw	a0,-36(s0)
  e4:	fcb42c23          	sw	a1,-40(s0)
  e8:	700007b7          	lui	a5,0x70000
  ec:	fef42623          	sw	a5,-20(s0)
  f0:	700007b7          	lui	a5,0x70000
  f4:	00478793          	addi	a5,a5,4 # 70000004 <_stack+0x4fffe004>
  f8:	fef42423          	sw	a5,-24(s0)
  fc:	700007b7          	lui	a5,0x70000
 100:	00878793          	addi	a5,a5,8 # 70000008 <_stack+0x4fffe008>
 104:	fef42223          	sw	a5,-28(s0)
 108:	fec42783          	lw	a5,-20(s0)
 10c:	fdc42703          	lw	a4,-36(s0)
 110:	00e7a023          	sw	a4,0(a5)
 114:	fe842783          	lw	a5,-24(s0)
 118:	fd842703          	lw	a4,-40(s0)
 11c:	00e7a023          	sw	a4,0(a5)
 120:	fe442783          	lw	a5,-28(s0)
 124:	0007a783          	lw	a5,0(a5)
 128:	00078513          	mv	a0,a5
 12c:	02c12403          	lw	s0,44(sp)
 130:	03010113          	addi	sp,sp,48
 134:	00008067          	ret

00000138 <main>:
 138:	fd010113          	addi	sp,sp,-48
 13c:	02112623          	sw	ra,44(sp)
 140:	02812423          	sw	s0,40(sp)
 144:	03010413          	addi	s0,sp,48
 148:	0ac000ef          	jal	1f4 <initialize_timer>
 14c:	000017b7          	lui	a5,0x1
 150:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x122b>
 154:	18c000ef          	jal	2e0 <start_timer>
 158:	fc042e23          	sw	zero,-36(s0)
 15c:	04c0006f          	j	1a8 <main+0x70>
 160:	fc042c23          	sw	zero,-40(s0)
 164:	02c0006f          	j	190 <main+0x58>
 168:	fdc42783          	lw	a5,-36(s0)
 16c:	fd842703          	lw	a4,-40(s0)
 170:	00070593          	mv	a1,a4
 174:	00078513          	mv	a0,a5
 178:	f5dff0ef          	jal	d4 <__mulsi3>
 17c:	00050793          	mv	a5,a0
 180:	fef42023          	sw	a5,-32(s0)
 184:	fd842783          	lw	a5,-40(s0)
 188:	00178793          	addi	a5,a5,1
 18c:	fcf42c23          	sw	a5,-40(s0)
 190:	fd842703          	lw	a4,-40(s0)
 194:	06300793          	li	a5,99
 198:	fce7d8e3          	bge	a5,a4,168 <main+0x30>
 19c:	fdc42783          	lw	a5,-36(s0)
 1a0:	00178793          	addi	a5,a5,1
 1a4:	fcf42e23          	sw	a5,-36(s0)
 1a8:	fdc42703          	lw	a4,-36(s0)
 1ac:	06300793          	li	a5,99
 1b0:	fae7d8e3          	bge	a5,a4,160 <main+0x28>
 1b4:	248000ef          	jal	3fc <end_timer>
 1b8:	fea42623          	sw	a0,-20(s0)
 1bc:	fec42783          	lw	a5,-20(s0)
 1c0:	0007a783          	lw	a5,0(a5)
 1c4:	fef405a3          	sb	a5,-21(s0)
 1c8:	27100513          	li	a0,625
 1cc:	268000ef          	jal	434 <uart_init>
 1d0:	feb44783          	lbu	a5,-21(s0)
 1d4:	00078513          	mv	a0,a5
 1d8:	29c000ef          	jal	474 <uart_putc>
 1dc:	00000793          	li	a5,0
 1e0:	00078513          	mv	a0,a5
 1e4:	02c12083          	lw	ra,44(sp)
 1e8:	02812403          	lw	s0,40(sp)
 1ec:	03010113          	addi	sp,sp,48
 1f0:	00008067          	ret

000001f4 <initialize_timer>:
 1f4:	ff010113          	addi	sp,sp,-16
 1f8:	00812623          	sw	s0,12(sp)
 1fc:	01010413          	addi	s0,sp,16
 200:	200007b7          	lui	a5,0x20000
 204:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 208:	60000737          	lui	a4,0x60000
 20c:	00e7a023          	sw	a4,0(a5)
 210:	200007b7          	lui	a5,0x20000
 214:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 218:	60000737          	lui	a4,0x60000
 21c:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 220:	00e7a223          	sw	a4,4(a5)
 224:	200007b7          	lui	a5,0x20000
 228:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 22c:	60000737          	lui	a4,0x60000
 230:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 234:	00e7a423          	sw	a4,8(a5)
 238:	200007b7          	lui	a5,0x20000
 23c:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 240:	60000737          	lui	a4,0x60000
 244:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 248:	00e7a623          	sw	a4,12(a5)
 24c:	200007b7          	lui	a5,0x20000
 250:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 254:	60000737          	lui	a4,0x60000
 258:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 25c:	00e7a823          	sw	a4,16(a5)
 260:	200007b7          	lui	a5,0x20000
 264:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 268:	60000737          	lui	a4,0x60000
 26c:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 270:	00e7aa23          	sw	a4,20(a5)
 274:	00000013          	nop
 278:	00c12403          	lw	s0,12(sp)
 27c:	01010113          	addi	sp,sp,16
 280:	00008067          	ret

00000284 <_start_timer>:
 284:	fe010113          	addi	sp,sp,-32
 288:	00812e23          	sw	s0,28(sp)
 28c:	02010413          	addi	s0,sp,32
 290:	fea42623          	sw	a0,-20(s0)
 294:	200007b7          	lui	a5,0x20000
 298:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 29c:	0087a783          	lw	a5,8(a5)
 2a0:	fec42703          	lw	a4,-20(s0)
 2a4:	00e7a023          	sw	a4,0(a5)
 2a8:	200007b7          	lui	a5,0x20000
 2ac:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 2b0:	0047a783          	lw	a5,4(a5)
 2b4:	00300713          	li	a4,3
 2b8:	00e7a023          	sw	a4,0(a5)
 2bc:	200007b7          	lui	a5,0x20000
 2c0:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 2c4:	0007a783          	lw	a5,0(a5)
 2c8:	00100713          	li	a4,1
 2cc:	00e7a023          	sw	a4,0(a5)
 2d0:	00000013          	nop
 2d4:	01c12403          	lw	s0,28(sp)
 2d8:	02010113          	addi	sp,sp,32
 2dc:	00008067          	ret

000002e0 <start_timer>:
 2e0:	fe010113          	addi	sp,sp,-32
 2e4:	00812e23          	sw	s0,28(sp)
 2e8:	02010413          	addi	s0,sp,32
 2ec:	fea42623          	sw	a0,-20(s0)
 2f0:	200007b7          	lui	a5,0x20000
 2f4:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 2f8:	0087a783          	lw	a5,8(a5)
 2fc:	fec42703          	lw	a4,-20(s0)
 300:	00e7a023          	sw	a4,0(a5)
 304:	200007b7          	lui	a5,0x20000
 308:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 30c:	0047a783          	lw	a5,4(a5)
 310:	00300713          	li	a4,3
 314:	00e7a023          	sw	a4,0(a5)
 318:	200007b7          	lui	a5,0x20000
 31c:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 320:	0007a783          	lw	a5,0(a5)
 324:	00100713          	li	a4,1
 328:	00e7a023          	sw	a4,0(a5)
 32c:	200007b7          	lui	a5,0x20000
 330:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 334:	00c7a783          	lw	a5,12(a5)
 338:	11111737          	lui	a4,0x11111
 33c:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110bcd>
 340:	00e7a023          	sw	a4,0(a5)
 344:	200007b7          	lui	a5,0x20000
 348:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 34c:	0107a783          	lw	a5,16(a5)
 350:	00078513          	mv	a0,a5
 354:	01c12403          	lw	s0,28(sp)
 358:	02010113          	addi	sp,sp,32
 35c:	00008067          	ret

00000360 <delay>:
 360:	fe010113          	addi	sp,sp,-32
 364:	00112e23          	sw	ra,28(sp)
 368:	00812c23          	sw	s0,24(sp)
 36c:	02010413          	addi	s0,sp,32
 370:	fea42623          	sw	a0,-20(s0)
 374:	000017b7          	lui	a5,0x1
 378:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x122b>
 37c:	f09ff0ef          	jal	284 <_start_timer>
 380:	200007b7          	lui	a5,0x20000
 384:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 388:	00c7a783          	lw	a5,12(a5)
 38c:	fec42703          	lw	a4,-20(s0)
 390:	00e7a023          	sw	a4,0(a5)
 394:	00000013          	nop
 398:	200007b7          	lui	a5,0x20000
 39c:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 3a0:	0107a783          	lw	a5,16(a5)
 3a4:	0007a703          	lw	a4,0(a5)
 3a8:	fec42783          	lw	a5,-20(s0)
 3ac:	fef716e3          	bne	a4,a5,398 <delay+0x38>
 3b0:	200007b7          	lui	a5,0x20000
 3b4:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 3b8:	0007a783          	lw	a5,0(a5)
 3bc:	0007a023          	sw	zero,0(a5)
 3c0:	00000013          	nop
 3c4:	01c12083          	lw	ra,28(sp)
 3c8:	01812403          	lw	s0,24(sp)
 3cc:	02010113          	addi	sp,sp,32
 3d0:	00008067          	ret

000003d4 <get_timer_counter>:
 3d4:	ff010113          	addi	sp,sp,-16
 3d8:	00812623          	sw	s0,12(sp)
 3dc:	01010413          	addi	s0,sp,16
 3e0:	200007b7          	lui	a5,0x20000
 3e4:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 3e8:	0107a783          	lw	a5,16(a5)
 3ec:	00078513          	mv	a0,a5
 3f0:	00c12403          	lw	s0,12(sp)
 3f4:	01010113          	addi	sp,sp,16
 3f8:	00008067          	ret

000003fc <end_timer>:
 3fc:	ff010113          	addi	sp,sp,-16
 400:	00812623          	sw	s0,12(sp)
 404:	01010413          	addi	s0,sp,16
 408:	200007b7          	lui	a5,0x20000
 40c:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 410:	0007a783          	lw	a5,0(a5)
 414:	0007a023          	sw	zero,0(a5)
 418:	200007b7          	lui	a5,0x20000
 41c:	01078793          	addi	a5,a5,16 # 20000010 <timer>
 420:	0107a783          	lw	a5,16(a5)
 424:	00078513          	mv	a0,a5
 428:	00c12403          	lw	s0,12(sp)
 42c:	01010113          	addi	sp,sp,16
 430:	00008067          	ret

00000434 <uart_init>:
 434:	fe010113          	addi	sp,sp,-32
 438:	00812e23          	sw	s0,28(sp)
 43c:	02010413          	addi	s0,sp,32
 440:	fea42623          	sw	a0,-20(s0)
 444:	200007b7          	lui	a5,0x20000
 448:	0047a783          	lw	a5,4(a5) # 20000004 <uart_bauddiv>
 44c:	fec42703          	lw	a4,-20(s0)
 450:	00e7a023          	sw	a4,0(a5)
 454:	200007b7          	lui	a5,0x20000
 458:	0007a783          	lw	a5,0(a5) # 20000000 <uart_ctrl>
 45c:	00100713          	li	a4,1
 460:	00e7a023          	sw	a4,0(a5)
 464:	00000013          	nop
 468:	01c12403          	lw	s0,28(sp)
 46c:	02010113          	addi	sp,sp,32
 470:	00008067          	ret

00000474 <uart_putc>:
 474:	fe010113          	addi	sp,sp,-32
 478:	00812e23          	sw	s0,28(sp)
 47c:	02010413          	addi	s0,sp,32
 480:	00050793          	mv	a5,a0
 484:	fef407a3          	sb	a5,-17(s0)
 488:	00000013          	nop
 48c:	200007b7          	lui	a5,0x20000
 490:	0087a783          	lw	a5,8(a5) # 20000008 <uart_status>
 494:	0007a783          	lw	a5,0(a5)
 498:	fe078ae3          	beqz	a5,48c <uart_putc+0x18>
 49c:	200007b7          	lui	a5,0x20000
 4a0:	00c7a783          	lw	a5,12(a5) # 2000000c <uart_data>
 4a4:	fef44703          	lbu	a4,-17(s0)
 4a8:	00e7a023          	sw	a4,0(a5)
 4ac:	200007b7          	lui	a5,0x20000
 4b0:	0007a783          	lw	a5,0(a5) # 20000000 <uart_ctrl>
 4b4:	0007a703          	lw	a4,0(a5)
 4b8:	200007b7          	lui	a5,0x20000
 4bc:	0007a783          	lw	a5,0(a5) # 20000000 <uart_ctrl>
 4c0:	00276713          	ori	a4,a4,2
 4c4:	00e7a023          	sw	a4,0(a5)
 4c8:	00000013          	nop
 4cc:	01c12403          	lw	s0,28(sp)
 4d0:	02010113          	addi	sp,sp,32
 4d4:	00008067          	ret

000004d8 <uart_puts>:
 4d8:	fd010113          	addi	sp,sp,-48
 4dc:	02112623          	sw	ra,44(sp)
 4e0:	02812423          	sw	s0,40(sp)
 4e4:	03010413          	addi	s0,sp,48
 4e8:	fca42e23          	sw	a0,-36(s0)
 4ec:	fe042623          	sw	zero,-20(s0)
 4f0:	0280006f          	j	518 <uart_puts+0x40>
 4f4:	fec42783          	lw	a5,-20(s0)
 4f8:	fdc42703          	lw	a4,-36(s0)
 4fc:	00f707b3          	add	a5,a4,a5
 500:	0007c783          	lbu	a5,0(a5)
 504:	00078513          	mv	a0,a5
 508:	f6dff0ef          	jal	474 <uart_putc>
 50c:	fec42783          	lw	a5,-20(s0)
 510:	00178793          	addi	a5,a5,1
 514:	fef42623          	sw	a5,-20(s0)
 518:	fec42783          	lw	a5,-20(s0)
 51c:	fdc42703          	lw	a4,-36(s0)
 520:	00f707b3          	add	a5,a4,a5
 524:	0007c783          	lbu	a5,0(a5)
 528:	fc0796e3          	bnez	a5,4f4 <uart_puts+0x1c>
 52c:	00000013          	nop
 530:	00000013          	nop
 534:	02c12083          	lw	ra,44(sp)
 538:	02812403          	lw	s0,40(sp)
 53c:	03010113          	addi	sp,sp,48
 540:	00008067          	ret

Disassembly of section .data:

20000000 <uart_ctrl>:
20000000:	0000                	.insn	2, 0x
20000002:	5000                	.insn	2, 0x5000

20000004 <uart_bauddiv>:
20000004:	0004                	.insn	2, 0x0004
20000006:	5000                	.insn	2, 0x5000

20000008 <uart_status>:
20000008:	0008                	.insn	2, 0x0008
2000000a:	5000                	.insn	2, 0x5000

2000000c <uart_data>:
2000000c:	000c                	.insn	2, 0x000c
2000000e:	5000                	.insn	2, 0x5000

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	.insn	2, 0x6431
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	.insn	2, 0x2029
  14:	3331                	.insn	2, 0x3331
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...
