
i2s.elf:     file format elf32-littleriscv


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
  84:	57450513          	addi	a0,a0,1396 # 5f4 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_data_2>
  90:	20000617          	auipc	a2,0x20000
  94:	f9460613          	addi	a2,a2,-108 # 20000024 <timer>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f7450513          	addi	a0,a0,-140 # 20000024 <timer>
  b8:	81818593          	addi	a1,gp,-2024 # 2000003c <_ebss>
  bc:	00b55863          	bge	a0,a1,cc <end_init_bss>

000000c0 <loop_init_bss>:
  c0:	00052023          	sw	zero,0(a0)
  c4:	00450513          	addi	a0,a0,4
  c8:	feb54ce3          	blt	a0,a1,c0 <loop_init_bss>

000000cc <end_init_bss>:
  cc:	008000ef          	jal	d4 <main>

000000d0 <loopy>:
  d0:	0000006f          	j	d0 <loopy>

000000d4 <main>:
  d4:	fe010113          	addi	sp,sp,-32
  d8:	00112e23          	sw	ra,28(sp)
  dc:	00812c23          	sw	s0,24(sp)
  e0:	02010413          	addi	s0,sp,32
  e4:	200007b7          	lui	a5,0x20000
  e8:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
  ec:	00100713          	li	a4,1
  f0:	00e7a023          	sw	a4,0(a5)
  f4:	00900513          	li	a0,9
  f8:	31c000ef          	jal	414 <uart_init>
  fc:	01c9c7b7          	lui	a5,0x1c9c
 100:	38078793          	addi	a5,a5,896 # 1c9c380 <_sidata+0x1c9bd8c>
 104:	fef42623          	sw	a5,-20(s0)
 108:	0680006f          	j	170 <main+0x9c>
 10c:	00000013          	nop
 110:	200007b7          	lui	a5,0x20000
 114:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_done>
 118:	0007a783          	lw	a5,0(a5)
 11c:	fe078ae3          	beqz	a5,110 <main+0x3c>
 120:	200007b7          	lui	a5,0x20000
 124:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 128:	0007a783          	lw	a5,0(a5)
 12c:	fef42223          	sw	a5,-28(s0)
 130:	fe442783          	lw	a5,-28(s0)
 134:	4107d793          	srai	a5,a5,0x10
 138:	0ff7f793          	zext.b	a5,a5
 13c:	fef405a3          	sb	a5,-21(s0)
 140:	fe442783          	lw	a5,-28(s0)
 144:	4187d793          	srai	a5,a5,0x18
 148:	0ff7f793          	zext.b	a5,a5
 14c:	fef40523          	sb	a5,-22(s0)
 150:	feb44783          	lbu	a5,-21(s0)
 154:	0ff7f793          	zext.b	a5,a5
 158:	00078513          	mv	a0,a5
 15c:	2f8000ef          	jal	454 <uart_putc>
 160:	fea44783          	lbu	a5,-22(s0)
 164:	0ff7f793          	zext.b	a5,a5
 168:	00078513          	mv	a0,a5
 16c:	2e8000ef          	jal	454 <uart_putc>
 170:	fec42783          	lw	a5,-20(s0)
 174:	fff78713          	addi	a4,a5,-1
 178:	fee42623          	sw	a4,-20(s0)
 17c:	f80798e3          	bnez	a5,10c <main+0x38>
 180:	00000793          	li	a5,0
 184:	00078513          	mv	a0,a5
 188:	01c12083          	lw	ra,28(sp)
 18c:	01812403          	lw	s0,24(sp)
 190:	02010113          	addi	sp,sp,32
 194:	00008067          	ret

00000198 <initialize_timer>:
 198:	ff010113          	addi	sp,sp,-16
 19c:	00812623          	sw	s0,12(sp)
 1a0:	01010413          	addi	s0,sp,16
 1a4:	200007b7          	lui	a5,0x20000
 1a8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1ac:	60000737          	lui	a4,0x60000
 1b0:	00e7a023          	sw	a4,0(a5)
 1b4:	200007b7          	lui	a5,0x20000
 1b8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1bc:	60000737          	lui	a4,0x60000
 1c0:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 1c4:	00e7a223          	sw	a4,4(a5)
 1c8:	200007b7          	lui	a5,0x20000
 1cc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1d0:	60000737          	lui	a4,0x60000
 1d4:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 1d8:	00e7a423          	sw	a4,8(a5)
 1dc:	200007b7          	lui	a5,0x20000
 1e0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1e4:	60000737          	lui	a4,0x60000
 1e8:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 1ec:	00e7a623          	sw	a4,12(a5)
 1f0:	200007b7          	lui	a5,0x20000
 1f4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1f8:	60000737          	lui	a4,0x60000
 1fc:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 200:	00e7a823          	sw	a4,16(a5)
 204:	200007b7          	lui	a5,0x20000
 208:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 20c:	60000737          	lui	a4,0x60000
 210:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 214:	00e7aa23          	sw	a4,20(a5)
 218:	00000013          	nop
 21c:	00c12403          	lw	s0,12(sp)
 220:	01010113          	addi	sp,sp,16
 224:	00008067          	ret

00000228 <_start_timer>:
 228:	fe010113          	addi	sp,sp,-32
 22c:	00812e23          	sw	s0,28(sp)
 230:	02010413          	addi	s0,sp,32
 234:	fea42623          	sw	a0,-20(s0)
 238:	200007b7          	lui	a5,0x20000
 23c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 240:	0087a783          	lw	a5,8(a5)
 244:	fec42703          	lw	a4,-20(s0)
 248:	00e7a023          	sw	a4,0(a5)
 24c:	200007b7          	lui	a5,0x20000
 250:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 254:	0047a783          	lw	a5,4(a5)
 258:	00300713          	li	a4,3
 25c:	00e7a023          	sw	a4,0(a5)
 260:	200007b7          	lui	a5,0x20000
 264:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 268:	0007a783          	lw	a5,0(a5)
 26c:	00100713          	li	a4,1
 270:	00e7a023          	sw	a4,0(a5)
 274:	00000013          	nop
 278:	01c12403          	lw	s0,28(sp)
 27c:	02010113          	addi	sp,sp,32
 280:	00008067          	ret

00000284 <start_timer>:
 284:	fe010113          	addi	sp,sp,-32
 288:	00812e23          	sw	s0,28(sp)
 28c:	02010413          	addi	s0,sp,32
 290:	fea42623          	sw	a0,-20(s0)
 294:	feb42423          	sw	a1,-24(s0)
 298:	200007b7          	lui	a5,0x20000
 29c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2a0:	0087a783          	lw	a5,8(a5)
 2a4:	fe842703          	lw	a4,-24(s0)
 2a8:	00e7a023          	sw	a4,0(a5)
 2ac:	200007b7          	lui	a5,0x20000
 2b0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2b4:	0047a783          	lw	a5,4(a5)
 2b8:	00300713          	li	a4,3
 2bc:	00e7a023          	sw	a4,0(a5)
 2c0:	200007b7          	lui	a5,0x20000
 2c4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2c8:	0007a783          	lw	a5,0(a5)
 2cc:	00100713          	li	a4,1
 2d0:	00e7a023          	sw	a4,0(a5)
 2d4:	200007b7          	lui	a5,0x20000
 2d8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2dc:	00c7a783          	lw	a5,12(a5)
 2e0:	11111737          	lui	a4,0x11111
 2e4:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110b1d>
 2e8:	00e7a023          	sw	a4,0(a5)
 2ec:	fec42783          	lw	a5,-20(s0)
 2f0:	20000737          	lui	a4,0x20000
 2f4:	02470713          	addi	a4,a4,36 # 20000024 <timer>
 2f8:	00072803          	lw	a6,0(a4)
 2fc:	00472503          	lw	a0,4(a4)
 300:	00872583          	lw	a1,8(a4)
 304:	00c72603          	lw	a2,12(a4)
 308:	01072683          	lw	a3,16(a4)
 30c:	01472703          	lw	a4,20(a4)
 310:	0107a023          	sw	a6,0(a5)
 314:	00a7a223          	sw	a0,4(a5)
 318:	00b7a423          	sw	a1,8(a5)
 31c:	00c7a623          	sw	a2,12(a5)
 320:	00d7a823          	sw	a3,16(a5)
 324:	00e7aa23          	sw	a4,20(a5)
 328:	fec42503          	lw	a0,-20(s0)
 32c:	01c12403          	lw	s0,28(sp)
 330:	02010113          	addi	sp,sp,32
 334:	00008067          	ret

00000338 <delay>:
 338:	fe010113          	addi	sp,sp,-32
 33c:	00112e23          	sw	ra,28(sp)
 340:	00812c23          	sw	s0,24(sp)
 344:	02010413          	addi	s0,sp,32
 348:	fea42623          	sw	a0,-20(s0)
 34c:	000017b7          	lui	a5,0x1
 350:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x117b>
 354:	ed5ff0ef          	jal	228 <_start_timer>
 358:	200007b7          	lui	a5,0x20000
 35c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 360:	00c7a783          	lw	a5,12(a5)
 364:	fec42703          	lw	a4,-20(s0)
 368:	00e7a023          	sw	a4,0(a5)
 36c:	00000013          	nop
 370:	200007b7          	lui	a5,0x20000
 374:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 378:	0107a783          	lw	a5,16(a5)
 37c:	0007a703          	lw	a4,0(a5)
 380:	fec42783          	lw	a5,-20(s0)
 384:	fef716e3          	bne	a4,a5,370 <delay+0x38>
 388:	200007b7          	lui	a5,0x20000
 38c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 390:	0007a783          	lw	a5,0(a5)
 394:	0007a023          	sw	zero,0(a5)
 398:	00000013          	nop
 39c:	01c12083          	lw	ra,28(sp)
 3a0:	01812403          	lw	s0,24(sp)
 3a4:	02010113          	addi	sp,sp,32
 3a8:	00008067          	ret

000003ac <get_timer_counter>:
 3ac:	ff010113          	addi	sp,sp,-16
 3b0:	00812623          	sw	s0,12(sp)
 3b4:	01010413          	addi	s0,sp,16
 3b8:	200007b7          	lui	a5,0x20000
 3bc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3c0:	0107a783          	lw	a5,16(a5)
 3c4:	0007a783          	lw	a5,0(a5)
 3c8:	00078513          	mv	a0,a5
 3cc:	00c12403          	lw	s0,12(sp)
 3d0:	01010113          	addi	sp,sp,16
 3d4:	00008067          	ret

000003d8 <end_timer>:
 3d8:	ff010113          	addi	sp,sp,-16
 3dc:	00812623          	sw	s0,12(sp)
 3e0:	01010413          	addi	s0,sp,16
 3e4:	200007b7          	lui	a5,0x20000
 3e8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3ec:	0007a783          	lw	a5,0(a5)
 3f0:	0007a023          	sw	zero,0(a5)
 3f4:	200007b7          	lui	a5,0x20000
 3f8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3fc:	0107a783          	lw	a5,16(a5)
 400:	0007a783          	lw	a5,0(a5)
 404:	00078513          	mv	a0,a5
 408:	00c12403          	lw	s0,12(sp)
 40c:	01010113          	addi	sp,sp,16
 410:	00008067          	ret

00000414 <uart_init>:
 414:	fe010113          	addi	sp,sp,-32
 418:	00812e23          	sw	s0,28(sp)
 41c:	02010413          	addi	s0,sp,32
 420:	fea42623          	sw	a0,-20(s0)
 424:	200007b7          	lui	a5,0x20000
 428:	0187a783          	lw	a5,24(a5) # 20000018 <uart_bauddiv>
 42c:	fec42703          	lw	a4,-20(s0)
 430:	00e7a023          	sw	a4,0(a5)
 434:	200007b7          	lui	a5,0x20000
 438:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 43c:	00100713          	li	a4,1
 440:	00e7a023          	sw	a4,0(a5)
 444:	00000013          	nop
 448:	01c12403          	lw	s0,28(sp)
 44c:	02010113          	addi	sp,sp,32
 450:	00008067          	ret

00000454 <uart_putc>:
 454:	fe010113          	addi	sp,sp,-32
 458:	00812e23          	sw	s0,28(sp)
 45c:	02010413          	addi	s0,sp,32
 460:	00050793          	mv	a5,a0
 464:	fef407a3          	sb	a5,-17(s0)
 468:	00000013          	nop
 46c:	200007b7          	lui	a5,0x20000
 470:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 474:	0007a783          	lw	a5,0(a5)
 478:	fe078ae3          	beqz	a5,46c <uart_putc+0x18>
 47c:	200007b7          	lui	a5,0x20000
 480:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 484:	fef44703          	lbu	a4,-17(s0)
 488:	00e7a023          	sw	a4,0(a5)
 48c:	200007b7          	lui	a5,0x20000
 490:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 494:	0007a703          	lw	a4,0(a5)
 498:	200007b7          	lui	a5,0x20000
 49c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4a0:	00276713          	ori	a4,a4,2
 4a4:	00e7a023          	sw	a4,0(a5)
 4a8:	00000013          	nop
 4ac:	01c12403          	lw	s0,28(sp)
 4b0:	02010113          	addi	sp,sp,32
 4b4:	00008067          	ret

000004b8 <uart_puts>:
 4b8:	fd010113          	addi	sp,sp,-48
 4bc:	02112623          	sw	ra,44(sp)
 4c0:	02812423          	sw	s0,40(sp)
 4c4:	03010413          	addi	s0,sp,48
 4c8:	fca42e23          	sw	a0,-36(s0)
 4cc:	fe042623          	sw	zero,-20(s0)
 4d0:	0280006f          	j	4f8 <uart_puts+0x40>
 4d4:	fec42783          	lw	a5,-20(s0)
 4d8:	fdc42703          	lw	a4,-36(s0)
 4dc:	00f707b3          	add	a5,a4,a5
 4e0:	0007c783          	lbu	a5,0(a5)
 4e4:	00078513          	mv	a0,a5
 4e8:	f6dff0ef          	jal	454 <uart_putc>
 4ec:	fec42783          	lw	a5,-20(s0)
 4f0:	00178793          	addi	a5,a5,1
 4f4:	fef42623          	sw	a5,-20(s0)
 4f8:	fec42783          	lw	a5,-20(s0)
 4fc:	fdc42703          	lw	a4,-36(s0)
 500:	00f707b3          	add	a5,a4,a5
 504:	0007c783          	lbu	a5,0(a5)
 508:	fc0796e3          	bnez	a5,4d4 <uart_puts+0x1c>
 50c:	00000013          	nop
 510:	00000013          	nop
 514:	02c12083          	lw	ra,44(sp)
 518:	02812403          	lw	s0,40(sp)
 51c:	03010113          	addi	sp,sp,48
 520:	00008067          	ret

00000524 <uart_puti8>:
 524:	fe010113          	addi	sp,sp,-32
 528:	00812e23          	sw	s0,28(sp)
 52c:	02010413          	addi	s0,sp,32
 530:	00050793          	mv	a5,a0
 534:	fef407a3          	sb	a5,-17(s0)
 538:	00000013          	nop
 53c:	200007b7          	lui	a5,0x20000
 540:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 544:	0007a783          	lw	a5,0(a5)
 548:	fe078ae3          	beqz	a5,53c <uart_puti8+0x18>
 54c:	200007b7          	lui	a5,0x20000
 550:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 554:	fef44703          	lbu	a4,-17(s0)
 558:	00e7a023          	sw	a4,0(a5)
 55c:	200007b7          	lui	a5,0x20000
 560:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 564:	0007a703          	lw	a4,0(a5)
 568:	200007b7          	lui	a5,0x20000
 56c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 570:	00276713          	ori	a4,a4,2
 574:	00e7a023          	sw	a4,0(a5)
 578:	00000013          	nop
 57c:	01c12403          	lw	s0,28(sp)
 580:	02010113          	addi	sp,sp,32
 584:	00008067          	ret

00000588 <uart_puti>:
 588:	fd010113          	addi	sp,sp,-48
 58c:	02112623          	sw	ra,44(sp)
 590:	02812423          	sw	s0,40(sp)
 594:	03010413          	addi	s0,sp,48
 598:	fca42e23          	sw	a0,-36(s0)
 59c:	fe042623          	sw	zero,-20(s0)
 5a0:	0300006f          	j	5d0 <uart_puti+0x48>
 5a4:	fec42783          	lw	a5,-20(s0)
 5a8:	00379793          	slli	a5,a5,0x3
 5ac:	fdc42703          	lw	a4,-36(s0)
 5b0:	40f757b3          	sra	a5,a4,a5
 5b4:	fef405a3          	sb	a5,-21(s0)
 5b8:	feb44783          	lbu	a5,-21(s0)
 5bc:	00078513          	mv	a0,a5
 5c0:	f65ff0ef          	jal	524 <uart_puti8>
 5c4:	fec42783          	lw	a5,-20(s0)
 5c8:	00178793          	addi	a5,a5,1
 5cc:	fef42623          	sw	a5,-20(s0)
 5d0:	fec42703          	lw	a4,-20(s0)
 5d4:	00300793          	li	a5,3
 5d8:	fce7d6e3          	bge	a5,a4,5a4 <uart_puti+0x1c>
 5dc:	00000013          	nop
 5e0:	00000013          	nop
 5e4:	02c12083          	lw	ra,44(sp)
 5e8:	02812403          	lw	s0,40(sp)
 5ec:	03010113          	addi	sp,sp,48
 5f0:	00008067          	ret

Disassembly of section .data:

20000000 <gpio_data_2>:
20000000:	0000                	.insn	2, 0x
20000002:	4200                	.insn	2, 0x4200

20000004 <gpio_oe_2>:
20000004:	0004                	.insn	2, 0x0004
20000006:	4200                	.insn	2, 0x4200

20000008 <i2s_en>:
20000008:	0000                	.insn	2, 0x
2000000a:	8000                	.insn	2, 0x8000

2000000c <i2s_done>:
2000000c:	0004                	.insn	2, 0x0004
2000000e:	8000                	.insn	2, 0x8000

20000010 <i2s_data>:
20000010:	0008                	.insn	2, 0x0008
20000012:	8000                	.insn	2, 0x8000

20000014 <uart_ctrl>:
20000014:	0000                	.insn	2, 0x
20000016:	5000                	.insn	2, 0x5000

20000018 <uart_bauddiv>:
20000018:	0004                	.insn	2, 0x0004
2000001a:	5000                	.insn	2, 0x5000

2000001c <uart_status>:
2000001c:	0008                	.insn	2, 0x0008
2000001e:	5000                	.insn	2, 0x5000

20000020 <uart_data>:
20000020:	000c                	.insn	2, 0x000c
20000022:	5000                	.insn	2, 0x5000

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	.insn	2, 0x2941
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	001f 0000 1004      	.insn	6, 0x10040000001f
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  26:	7031                	.insn	2, 0x7031
  28:	0030                	.insn	2, 0x0030

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
