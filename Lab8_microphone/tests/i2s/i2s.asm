
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
  84:	59450513          	addi	a0,a0,1428 # 614 <_sidata>
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
  f4:	00300513          	li	a0,3
  f8:	33c000ef          	jal	434 <uart_init>
  fc:	01c9c7b7          	lui	a5,0x1c9c
 100:	38078793          	addi	a5,a5,896 # 1c9c380 <_sidata+0x1c9bd6c>
 104:	fef42623          	sw	a5,-20(s0)
 108:	200007b7          	lui	a5,0x20000
 10c:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 110:	fff00713          	li	a4,-1
 114:	00e7a023          	sw	a4,0(a5)
 118:	0780006f          	j	190 <main+0xbc>
 11c:	00000013          	nop
 120:	200007b7          	lui	a5,0x20000
 124:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_done>
 128:	0007a783          	lw	a5,0(a5)
 12c:	fe078ae3          	beqz	a5,120 <main+0x4c>
 130:	200007b7          	lui	a5,0x20000
 134:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 138:	0007a783          	lw	a5,0(a5)
 13c:	fef42223          	sw	a5,-28(s0)
 140:	fe442703          	lw	a4,-28(s0)
 144:	200007b7          	lui	a5,0x20000
 148:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 14c:	00e7a023          	sw	a4,0(a5)
 150:	fe442783          	lw	a5,-28(s0)
 154:	4187d793          	srai	a5,a5,0x18
 158:	0ff7f793          	zext.b	a5,a5
 15c:	fef405a3          	sb	a5,-21(s0)
 160:	fe442783          	lw	a5,-28(s0)
 164:	4107d793          	srai	a5,a5,0x10
 168:	0ff7f793          	zext.b	a5,a5
 16c:	fef40523          	sb	a5,-22(s0)
 170:	feb44783          	lbu	a5,-21(s0)
 174:	0ff7f793          	zext.b	a5,a5
 178:	00078513          	mv	a0,a5
 17c:	2f8000ef          	jal	474 <uart_putc>
 180:	fea44783          	lbu	a5,-22(s0)
 184:	0ff7f793          	zext.b	a5,a5
 188:	00078513          	mv	a0,a5
 18c:	2e8000ef          	jal	474 <uart_putc>
 190:	fec42783          	lw	a5,-20(s0)
 194:	fff78713          	addi	a4,a5,-1
 198:	fee42623          	sw	a4,-20(s0)
 19c:	f80790e3          	bnez	a5,11c <main+0x48>
 1a0:	00000793          	li	a5,0
 1a4:	00078513          	mv	a0,a5
 1a8:	01c12083          	lw	ra,28(sp)
 1ac:	01812403          	lw	s0,24(sp)
 1b0:	02010113          	addi	sp,sp,32
 1b4:	00008067          	ret

000001b8 <initialize_timer>:
 1b8:	ff010113          	addi	sp,sp,-16
 1bc:	00812623          	sw	s0,12(sp)
 1c0:	01010413          	addi	s0,sp,16
 1c4:	200007b7          	lui	a5,0x20000
 1c8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1cc:	60000737          	lui	a4,0x60000
 1d0:	00e7a023          	sw	a4,0(a5)
 1d4:	200007b7          	lui	a5,0x20000
 1d8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1dc:	60000737          	lui	a4,0x60000
 1e0:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 1e4:	00e7a223          	sw	a4,4(a5)
 1e8:	200007b7          	lui	a5,0x20000
 1ec:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1f0:	60000737          	lui	a4,0x60000
 1f4:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 1f8:	00e7a423          	sw	a4,8(a5)
 1fc:	200007b7          	lui	a5,0x20000
 200:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 204:	60000737          	lui	a4,0x60000
 208:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 20c:	00e7a623          	sw	a4,12(a5)
 210:	200007b7          	lui	a5,0x20000
 214:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 218:	60000737          	lui	a4,0x60000
 21c:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 220:	00e7a823          	sw	a4,16(a5)
 224:	200007b7          	lui	a5,0x20000
 228:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 22c:	60000737          	lui	a4,0x60000
 230:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 234:	00e7aa23          	sw	a4,20(a5)
 238:	00000013          	nop
 23c:	00c12403          	lw	s0,12(sp)
 240:	01010113          	addi	sp,sp,16
 244:	00008067          	ret

00000248 <_start_timer>:
 248:	fe010113          	addi	sp,sp,-32
 24c:	00812e23          	sw	s0,28(sp)
 250:	02010413          	addi	s0,sp,32
 254:	fea42623          	sw	a0,-20(s0)
 258:	200007b7          	lui	a5,0x20000
 25c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 260:	0087a783          	lw	a5,8(a5)
 264:	fec42703          	lw	a4,-20(s0)
 268:	00e7a023          	sw	a4,0(a5)
 26c:	200007b7          	lui	a5,0x20000
 270:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 274:	0047a783          	lw	a5,4(a5)
 278:	00300713          	li	a4,3
 27c:	00e7a023          	sw	a4,0(a5)
 280:	200007b7          	lui	a5,0x20000
 284:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 288:	0007a783          	lw	a5,0(a5)
 28c:	00100713          	li	a4,1
 290:	00e7a023          	sw	a4,0(a5)
 294:	00000013          	nop
 298:	01c12403          	lw	s0,28(sp)
 29c:	02010113          	addi	sp,sp,32
 2a0:	00008067          	ret

000002a4 <start_timer>:
 2a4:	fe010113          	addi	sp,sp,-32
 2a8:	00812e23          	sw	s0,28(sp)
 2ac:	02010413          	addi	s0,sp,32
 2b0:	fea42623          	sw	a0,-20(s0)
 2b4:	feb42423          	sw	a1,-24(s0)
 2b8:	200007b7          	lui	a5,0x20000
 2bc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2c0:	0087a783          	lw	a5,8(a5)
 2c4:	fe842703          	lw	a4,-24(s0)
 2c8:	00e7a023          	sw	a4,0(a5)
 2cc:	200007b7          	lui	a5,0x20000
 2d0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2d4:	0047a783          	lw	a5,4(a5)
 2d8:	00300713          	li	a4,3
 2dc:	00e7a023          	sw	a4,0(a5)
 2e0:	200007b7          	lui	a5,0x20000
 2e4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2e8:	0007a783          	lw	a5,0(a5)
 2ec:	00100713          	li	a4,1
 2f0:	00e7a023          	sw	a4,0(a5)
 2f4:	200007b7          	lui	a5,0x20000
 2f8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2fc:	00c7a783          	lw	a5,12(a5)
 300:	11111737          	lui	a4,0x11111
 304:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110afd>
 308:	00e7a023          	sw	a4,0(a5)
 30c:	fec42783          	lw	a5,-20(s0)
 310:	20000737          	lui	a4,0x20000
 314:	02470713          	addi	a4,a4,36 # 20000024 <timer>
 318:	00072803          	lw	a6,0(a4)
 31c:	00472503          	lw	a0,4(a4)
 320:	00872583          	lw	a1,8(a4)
 324:	00c72603          	lw	a2,12(a4)
 328:	01072683          	lw	a3,16(a4)
 32c:	01472703          	lw	a4,20(a4)
 330:	0107a023          	sw	a6,0(a5)
 334:	00a7a223          	sw	a0,4(a5)
 338:	00b7a423          	sw	a1,8(a5)
 33c:	00c7a623          	sw	a2,12(a5)
 340:	00d7a823          	sw	a3,16(a5)
 344:	00e7aa23          	sw	a4,20(a5)
 348:	fec42503          	lw	a0,-20(s0)
 34c:	01c12403          	lw	s0,28(sp)
 350:	02010113          	addi	sp,sp,32
 354:	00008067          	ret

00000358 <delay>:
 358:	fe010113          	addi	sp,sp,-32
 35c:	00112e23          	sw	ra,28(sp)
 360:	00812c23          	sw	s0,24(sp)
 364:	02010413          	addi	s0,sp,32
 368:	fea42623          	sw	a0,-20(s0)
 36c:	000017b7          	lui	a5,0x1
 370:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x115b>
 374:	ed5ff0ef          	jal	248 <_start_timer>
 378:	200007b7          	lui	a5,0x20000
 37c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 380:	00c7a783          	lw	a5,12(a5)
 384:	fec42703          	lw	a4,-20(s0)
 388:	00e7a023          	sw	a4,0(a5)
 38c:	00000013          	nop
 390:	200007b7          	lui	a5,0x20000
 394:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 398:	0107a783          	lw	a5,16(a5)
 39c:	0007a703          	lw	a4,0(a5)
 3a0:	fec42783          	lw	a5,-20(s0)
 3a4:	fef716e3          	bne	a4,a5,390 <delay+0x38>
 3a8:	200007b7          	lui	a5,0x20000
 3ac:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3b0:	0007a783          	lw	a5,0(a5)
 3b4:	0007a023          	sw	zero,0(a5)
 3b8:	00000013          	nop
 3bc:	01c12083          	lw	ra,28(sp)
 3c0:	01812403          	lw	s0,24(sp)
 3c4:	02010113          	addi	sp,sp,32
 3c8:	00008067          	ret

000003cc <get_timer_counter>:
 3cc:	ff010113          	addi	sp,sp,-16
 3d0:	00812623          	sw	s0,12(sp)
 3d4:	01010413          	addi	s0,sp,16
 3d8:	200007b7          	lui	a5,0x20000
 3dc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3e0:	0107a783          	lw	a5,16(a5)
 3e4:	0007a783          	lw	a5,0(a5)
 3e8:	00078513          	mv	a0,a5
 3ec:	00c12403          	lw	s0,12(sp)
 3f0:	01010113          	addi	sp,sp,16
 3f4:	00008067          	ret

000003f8 <end_timer>:
 3f8:	ff010113          	addi	sp,sp,-16
 3fc:	00812623          	sw	s0,12(sp)
 400:	01010413          	addi	s0,sp,16
 404:	200007b7          	lui	a5,0x20000
 408:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 40c:	0007a783          	lw	a5,0(a5)
 410:	0007a023          	sw	zero,0(a5)
 414:	200007b7          	lui	a5,0x20000
 418:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 41c:	0107a783          	lw	a5,16(a5)
 420:	0007a783          	lw	a5,0(a5)
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
 448:	0187a783          	lw	a5,24(a5) # 20000018 <uart_bauddiv>
 44c:	fec42703          	lw	a4,-20(s0)
 450:	00e7a023          	sw	a4,0(a5)
 454:	200007b7          	lui	a5,0x20000
 458:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
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
 490:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 494:	0007a783          	lw	a5,0(a5)
 498:	fe078ae3          	beqz	a5,48c <uart_putc+0x18>
 49c:	200007b7          	lui	a5,0x20000
 4a0:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 4a4:	fef44703          	lbu	a4,-17(s0)
 4a8:	00e7a023          	sw	a4,0(a5)
 4ac:	200007b7          	lui	a5,0x20000
 4b0:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4b4:	0007a703          	lw	a4,0(a5)
 4b8:	200007b7          	lui	a5,0x20000
 4bc:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
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

00000544 <uart_puti8>:
 544:	fe010113          	addi	sp,sp,-32
 548:	00812e23          	sw	s0,28(sp)
 54c:	02010413          	addi	s0,sp,32
 550:	00050793          	mv	a5,a0
 554:	fef407a3          	sb	a5,-17(s0)
 558:	00000013          	nop
 55c:	200007b7          	lui	a5,0x20000
 560:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 564:	0007a783          	lw	a5,0(a5)
 568:	fe078ae3          	beqz	a5,55c <uart_puti8+0x18>
 56c:	200007b7          	lui	a5,0x20000
 570:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 574:	fef44703          	lbu	a4,-17(s0)
 578:	00e7a023          	sw	a4,0(a5)
 57c:	200007b7          	lui	a5,0x20000
 580:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 584:	0007a703          	lw	a4,0(a5)
 588:	200007b7          	lui	a5,0x20000
 58c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 590:	00276713          	ori	a4,a4,2
 594:	00e7a023          	sw	a4,0(a5)
 598:	00000013          	nop
 59c:	01c12403          	lw	s0,28(sp)
 5a0:	02010113          	addi	sp,sp,32
 5a4:	00008067          	ret

000005a8 <uart_puti>:
 5a8:	fd010113          	addi	sp,sp,-48
 5ac:	02112623          	sw	ra,44(sp)
 5b0:	02812423          	sw	s0,40(sp)
 5b4:	03010413          	addi	s0,sp,48
 5b8:	fca42e23          	sw	a0,-36(s0)
 5bc:	fe042623          	sw	zero,-20(s0)
 5c0:	0300006f          	j	5f0 <uart_puti+0x48>
 5c4:	fec42783          	lw	a5,-20(s0)
 5c8:	00379793          	slli	a5,a5,0x3
 5cc:	fdc42703          	lw	a4,-36(s0)
 5d0:	40f757b3          	sra	a5,a4,a5
 5d4:	fef405a3          	sb	a5,-21(s0)
 5d8:	feb44783          	lbu	a5,-21(s0)
 5dc:	00078513          	mv	a0,a5
 5e0:	f65ff0ef          	jal	544 <uart_puti8>
 5e4:	fec42783          	lw	a5,-20(s0)
 5e8:	00178793          	addi	a5,a5,1
 5ec:	fef42623          	sw	a5,-20(s0)
 5f0:	fec42703          	lw	a4,-20(s0)
 5f4:	00300793          	li	a5,3
 5f8:	fce7d6e3          	bge	a5,a4,5c4 <uart_puti+0x1c>
 5fc:	00000013          	nop
 600:	00000013          	nop
 604:	02c12083          	lw	ra,44(sp)
 608:	02812403          	lw	s0,40(sp)
 60c:	03010113          	addi	sp,sp,48
 610:	00008067          	ret

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
