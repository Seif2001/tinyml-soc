
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
  84:	59850513          	addi	a0,a0,1432 # 618 <_sidata>
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
  ec:	00900713          	li	a4,9
  f0:	00e7a023          	sw	a4,0(a5)
  f4:	00300513          	li	a0,3
  f8:	340000ef          	jal	438 <uart_init>
  fc:	01c9c7b7          	lui	a5,0x1c9c
 100:	38078793          	addi	a5,a5,896 # 1c9c380 <_sidata+0x1c9bd68>
 104:	fef42623          	sw	a5,-20(s0)
 108:	200007b7          	lui	a5,0x20000
 10c:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 110:	fff00713          	li	a4,-1
 114:	00e7a023          	sw	a4,0(a5)
 118:	07c0006f          	j	194 <main+0xc0>
 11c:	00000013          	nop
 120:	200007b7          	lui	a5,0x20000
 124:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_done>
 128:	0007a703          	lw	a4,0(a5)
 12c:	00300793          	li	a5,3
 130:	fef718e3          	bne	a4,a5,120 <main+0x4c>
 134:	200007b7          	lui	a5,0x20000
 138:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 13c:	0007a783          	lw	a5,0(a5)
 140:	fef42423          	sw	a5,-24(s0)
 144:	fe842703          	lw	a4,-24(s0)
 148:	200007b7          	lui	a5,0x20000
 14c:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 150:	00e7a023          	sw	a4,0(a5)
 154:	fe842783          	lw	a5,-24(s0)
 158:	4187d793          	srai	a5,a5,0x18
 15c:	0ff7f793          	zext.b	a5,a5
 160:	fef403a3          	sb	a5,-25(s0)
 164:	fe842783          	lw	a5,-24(s0)
 168:	4107d793          	srai	a5,a5,0x10
 16c:	0ff7f793          	zext.b	a5,a5
 170:	fef40323          	sb	a5,-26(s0)
 174:	fe744783          	lbu	a5,-25(s0)
 178:	0ff7f793          	zext.b	a5,a5
 17c:	00078513          	mv	a0,a5
 180:	2f8000ef          	jal	478 <uart_putc>
 184:	fe644783          	lbu	a5,-26(s0)
 188:	0ff7f793          	zext.b	a5,a5
 18c:	00078513          	mv	a0,a5
 190:	2e8000ef          	jal	478 <uart_putc>
 194:	fec42783          	lw	a5,-20(s0)
 198:	fff78713          	addi	a4,a5,-1
 19c:	fee42623          	sw	a4,-20(s0)
 1a0:	f6079ee3          	bnez	a5,11c <main+0x48>
 1a4:	00000793          	li	a5,0
 1a8:	00078513          	mv	a0,a5
 1ac:	01c12083          	lw	ra,28(sp)
 1b0:	01812403          	lw	s0,24(sp)
 1b4:	02010113          	addi	sp,sp,32
 1b8:	00008067          	ret

000001bc <initialize_timer>:
 1bc:	ff010113          	addi	sp,sp,-16
 1c0:	00812623          	sw	s0,12(sp)
 1c4:	01010413          	addi	s0,sp,16
 1c8:	200007b7          	lui	a5,0x20000
 1cc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1d0:	60000737          	lui	a4,0x60000
 1d4:	00e7a023          	sw	a4,0(a5)
 1d8:	200007b7          	lui	a5,0x20000
 1dc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1e0:	60000737          	lui	a4,0x60000
 1e4:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 1e8:	00e7a223          	sw	a4,4(a5)
 1ec:	200007b7          	lui	a5,0x20000
 1f0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1f4:	60000737          	lui	a4,0x60000
 1f8:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 1fc:	00e7a423          	sw	a4,8(a5)
 200:	200007b7          	lui	a5,0x20000
 204:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 208:	60000737          	lui	a4,0x60000
 20c:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 210:	00e7a623          	sw	a4,12(a5)
 214:	200007b7          	lui	a5,0x20000
 218:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 21c:	60000737          	lui	a4,0x60000
 220:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 224:	00e7a823          	sw	a4,16(a5)
 228:	200007b7          	lui	a5,0x20000
 22c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 230:	60000737          	lui	a4,0x60000
 234:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 238:	00e7aa23          	sw	a4,20(a5)
 23c:	00000013          	nop
 240:	00c12403          	lw	s0,12(sp)
 244:	01010113          	addi	sp,sp,16
 248:	00008067          	ret

0000024c <_start_timer>:
 24c:	fe010113          	addi	sp,sp,-32
 250:	00812e23          	sw	s0,28(sp)
 254:	02010413          	addi	s0,sp,32
 258:	fea42623          	sw	a0,-20(s0)
 25c:	200007b7          	lui	a5,0x20000
 260:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 264:	0087a783          	lw	a5,8(a5)
 268:	fec42703          	lw	a4,-20(s0)
 26c:	00e7a023          	sw	a4,0(a5)
 270:	200007b7          	lui	a5,0x20000
 274:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 278:	0047a783          	lw	a5,4(a5)
 27c:	00300713          	li	a4,3
 280:	00e7a023          	sw	a4,0(a5)
 284:	200007b7          	lui	a5,0x20000
 288:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 28c:	0007a783          	lw	a5,0(a5)
 290:	00100713          	li	a4,1
 294:	00e7a023          	sw	a4,0(a5)
 298:	00000013          	nop
 29c:	01c12403          	lw	s0,28(sp)
 2a0:	02010113          	addi	sp,sp,32
 2a4:	00008067          	ret

000002a8 <start_timer>:
 2a8:	fe010113          	addi	sp,sp,-32
 2ac:	00812e23          	sw	s0,28(sp)
 2b0:	02010413          	addi	s0,sp,32
 2b4:	fea42623          	sw	a0,-20(s0)
 2b8:	feb42423          	sw	a1,-24(s0)
 2bc:	200007b7          	lui	a5,0x20000
 2c0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2c4:	0087a783          	lw	a5,8(a5)
 2c8:	fe842703          	lw	a4,-24(s0)
 2cc:	00e7a023          	sw	a4,0(a5)
 2d0:	200007b7          	lui	a5,0x20000
 2d4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2d8:	0047a783          	lw	a5,4(a5)
 2dc:	00300713          	li	a4,3
 2e0:	00e7a023          	sw	a4,0(a5)
 2e4:	200007b7          	lui	a5,0x20000
 2e8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2ec:	0007a783          	lw	a5,0(a5)
 2f0:	00100713          	li	a4,1
 2f4:	00e7a023          	sw	a4,0(a5)
 2f8:	200007b7          	lui	a5,0x20000
 2fc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 300:	00c7a783          	lw	a5,12(a5)
 304:	11111737          	lui	a4,0x11111
 308:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110af9>
 30c:	00e7a023          	sw	a4,0(a5)
 310:	fec42783          	lw	a5,-20(s0)
 314:	20000737          	lui	a4,0x20000
 318:	02470713          	addi	a4,a4,36 # 20000024 <timer>
 31c:	00072803          	lw	a6,0(a4)
 320:	00472503          	lw	a0,4(a4)
 324:	00872583          	lw	a1,8(a4)
 328:	00c72603          	lw	a2,12(a4)
 32c:	01072683          	lw	a3,16(a4)
 330:	01472703          	lw	a4,20(a4)
 334:	0107a023          	sw	a6,0(a5)
 338:	00a7a223          	sw	a0,4(a5)
 33c:	00b7a423          	sw	a1,8(a5)
 340:	00c7a623          	sw	a2,12(a5)
 344:	00d7a823          	sw	a3,16(a5)
 348:	00e7aa23          	sw	a4,20(a5)
 34c:	fec42503          	lw	a0,-20(s0)
 350:	01c12403          	lw	s0,28(sp)
 354:	02010113          	addi	sp,sp,32
 358:	00008067          	ret

0000035c <delay>:
 35c:	fe010113          	addi	sp,sp,-32
 360:	00112e23          	sw	ra,28(sp)
 364:	00812c23          	sw	s0,24(sp)
 368:	02010413          	addi	s0,sp,32
 36c:	fea42623          	sw	a0,-20(s0)
 370:	000017b7          	lui	a5,0x1
 374:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x1157>
 378:	ed5ff0ef          	jal	24c <_start_timer>
 37c:	200007b7          	lui	a5,0x20000
 380:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 384:	00c7a783          	lw	a5,12(a5)
 388:	fec42703          	lw	a4,-20(s0)
 38c:	00e7a023          	sw	a4,0(a5)
 390:	00000013          	nop
 394:	200007b7          	lui	a5,0x20000
 398:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 39c:	0107a783          	lw	a5,16(a5)
 3a0:	0007a703          	lw	a4,0(a5)
 3a4:	fec42783          	lw	a5,-20(s0)
 3a8:	fef716e3          	bne	a4,a5,394 <delay+0x38>
 3ac:	200007b7          	lui	a5,0x20000
 3b0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3b4:	0007a783          	lw	a5,0(a5)
 3b8:	0007a023          	sw	zero,0(a5)
 3bc:	00000013          	nop
 3c0:	01c12083          	lw	ra,28(sp)
 3c4:	01812403          	lw	s0,24(sp)
 3c8:	02010113          	addi	sp,sp,32
 3cc:	00008067          	ret

000003d0 <get_timer_counter>:
 3d0:	ff010113          	addi	sp,sp,-16
 3d4:	00812623          	sw	s0,12(sp)
 3d8:	01010413          	addi	s0,sp,16
 3dc:	200007b7          	lui	a5,0x20000
 3e0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3e4:	0107a783          	lw	a5,16(a5)
 3e8:	0007a783          	lw	a5,0(a5)
 3ec:	00078513          	mv	a0,a5
 3f0:	00c12403          	lw	s0,12(sp)
 3f4:	01010113          	addi	sp,sp,16
 3f8:	00008067          	ret

000003fc <end_timer>:
 3fc:	ff010113          	addi	sp,sp,-16
 400:	00812623          	sw	s0,12(sp)
 404:	01010413          	addi	s0,sp,16
 408:	200007b7          	lui	a5,0x20000
 40c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 410:	0007a783          	lw	a5,0(a5)
 414:	0007a023          	sw	zero,0(a5)
 418:	200007b7          	lui	a5,0x20000
 41c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 420:	0107a783          	lw	a5,16(a5)
 424:	0007a783          	lw	a5,0(a5)
 428:	00078513          	mv	a0,a5
 42c:	00c12403          	lw	s0,12(sp)
 430:	01010113          	addi	sp,sp,16
 434:	00008067          	ret

00000438 <uart_init>:
 438:	fe010113          	addi	sp,sp,-32
 43c:	00812e23          	sw	s0,28(sp)
 440:	02010413          	addi	s0,sp,32
 444:	fea42623          	sw	a0,-20(s0)
 448:	200007b7          	lui	a5,0x20000
 44c:	0187a783          	lw	a5,24(a5) # 20000018 <uart_bauddiv>
 450:	fec42703          	lw	a4,-20(s0)
 454:	00e7a023          	sw	a4,0(a5)
 458:	200007b7          	lui	a5,0x20000
 45c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 460:	00100713          	li	a4,1
 464:	00e7a023          	sw	a4,0(a5)
 468:	00000013          	nop
 46c:	01c12403          	lw	s0,28(sp)
 470:	02010113          	addi	sp,sp,32
 474:	00008067          	ret

00000478 <uart_putc>:
 478:	fe010113          	addi	sp,sp,-32
 47c:	00812e23          	sw	s0,28(sp)
 480:	02010413          	addi	s0,sp,32
 484:	00050793          	mv	a5,a0
 488:	fef407a3          	sb	a5,-17(s0)
 48c:	00000013          	nop
 490:	200007b7          	lui	a5,0x20000
 494:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 498:	0007a783          	lw	a5,0(a5)
 49c:	fe078ae3          	beqz	a5,490 <uart_putc+0x18>
 4a0:	200007b7          	lui	a5,0x20000
 4a4:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 4a8:	fef44703          	lbu	a4,-17(s0)
 4ac:	00e7a023          	sw	a4,0(a5)
 4b0:	200007b7          	lui	a5,0x20000
 4b4:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4b8:	0007a703          	lw	a4,0(a5)
 4bc:	200007b7          	lui	a5,0x20000
 4c0:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4c4:	00276713          	ori	a4,a4,2
 4c8:	00e7a023          	sw	a4,0(a5)
 4cc:	00000013          	nop
 4d0:	01c12403          	lw	s0,28(sp)
 4d4:	02010113          	addi	sp,sp,32
 4d8:	00008067          	ret

000004dc <uart_puts>:
 4dc:	fd010113          	addi	sp,sp,-48
 4e0:	02112623          	sw	ra,44(sp)
 4e4:	02812423          	sw	s0,40(sp)
 4e8:	03010413          	addi	s0,sp,48
 4ec:	fca42e23          	sw	a0,-36(s0)
 4f0:	fe042623          	sw	zero,-20(s0)
 4f4:	0280006f          	j	51c <uart_puts+0x40>
 4f8:	fec42783          	lw	a5,-20(s0)
 4fc:	fdc42703          	lw	a4,-36(s0)
 500:	00f707b3          	add	a5,a4,a5
 504:	0007c783          	lbu	a5,0(a5)
 508:	00078513          	mv	a0,a5
 50c:	f6dff0ef          	jal	478 <uart_putc>
 510:	fec42783          	lw	a5,-20(s0)
 514:	00178793          	addi	a5,a5,1
 518:	fef42623          	sw	a5,-20(s0)
 51c:	fec42783          	lw	a5,-20(s0)
 520:	fdc42703          	lw	a4,-36(s0)
 524:	00f707b3          	add	a5,a4,a5
 528:	0007c783          	lbu	a5,0(a5)
 52c:	fc0796e3          	bnez	a5,4f8 <uart_puts+0x1c>
 530:	00000013          	nop
 534:	00000013          	nop
 538:	02c12083          	lw	ra,44(sp)
 53c:	02812403          	lw	s0,40(sp)
 540:	03010113          	addi	sp,sp,48
 544:	00008067          	ret

00000548 <uart_puti8>:
 548:	fe010113          	addi	sp,sp,-32
 54c:	00812e23          	sw	s0,28(sp)
 550:	02010413          	addi	s0,sp,32
 554:	00050793          	mv	a5,a0
 558:	fef407a3          	sb	a5,-17(s0)
 55c:	00000013          	nop
 560:	200007b7          	lui	a5,0x20000
 564:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 568:	0007a783          	lw	a5,0(a5)
 56c:	fe078ae3          	beqz	a5,560 <uart_puti8+0x18>
 570:	200007b7          	lui	a5,0x20000
 574:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 578:	fef44703          	lbu	a4,-17(s0)
 57c:	00e7a023          	sw	a4,0(a5)
 580:	200007b7          	lui	a5,0x20000
 584:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 588:	0007a703          	lw	a4,0(a5)
 58c:	200007b7          	lui	a5,0x20000
 590:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 594:	00276713          	ori	a4,a4,2
 598:	00e7a023          	sw	a4,0(a5)
 59c:	00000013          	nop
 5a0:	01c12403          	lw	s0,28(sp)
 5a4:	02010113          	addi	sp,sp,32
 5a8:	00008067          	ret

000005ac <uart_puti>:
 5ac:	fd010113          	addi	sp,sp,-48
 5b0:	02112623          	sw	ra,44(sp)
 5b4:	02812423          	sw	s0,40(sp)
 5b8:	03010413          	addi	s0,sp,48
 5bc:	fca42e23          	sw	a0,-36(s0)
 5c0:	fe042623          	sw	zero,-20(s0)
 5c4:	0300006f          	j	5f4 <uart_puti+0x48>
 5c8:	fec42783          	lw	a5,-20(s0)
 5cc:	00379793          	slli	a5,a5,0x3
 5d0:	fdc42703          	lw	a4,-36(s0)
 5d4:	40f757b3          	sra	a5,a4,a5
 5d8:	fef405a3          	sb	a5,-21(s0)
 5dc:	feb44783          	lbu	a5,-21(s0)
 5e0:	00078513          	mv	a0,a5
 5e4:	f65ff0ef          	jal	548 <uart_puti8>
 5e8:	fec42783          	lw	a5,-20(s0)
 5ec:	00178793          	addi	a5,a5,1
 5f0:	fef42623          	sw	a5,-20(s0)
 5f4:	fec42703          	lw	a4,-20(s0)
 5f8:	00300793          	li	a5,3
 5fc:	fce7d6e3          	bge	a5,a4,5c8 <uart_puti+0x1c>
 600:	00000013          	nop
 604:	00000013          	nop
 608:	02c12083          	lw	ra,44(sp)
 60c:	02812403          	lw	s0,40(sp)
 610:	03010113          	addi	sp,sp,48
 614:	00008067          	ret

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
