
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
  84:	5a450513          	addi	a0,a0,1444 # 624 <_sidata>
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
  f8:	34c000ef          	jal	444 <uart_init>
  fc:	01c9c7b7          	lui	a5,0x1c9c
 100:	38078793          	addi	a5,a5,896 # 1c9c380 <_sidata+0x1c9bd5c>
 104:	fef42623          	sw	a5,-20(s0)
 108:	200007b7          	lui	a5,0x20000
 10c:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 110:	fff00713          	li	a4,-1
 114:	00e7a023          	sw	a4,0(a5)
 118:	0880006f          	j	1a0 <main+0xcc>
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
 144:	200007b7          	lui	a5,0x20000
 148:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_done>
 14c:	0007a023          	sw	zero,0(a5)
 150:	fe842703          	lw	a4,-24(s0)
 154:	200007b7          	lui	a5,0x20000
 158:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 15c:	00e7a023          	sw	a4,0(a5)
 160:	fe842783          	lw	a5,-24(s0)
 164:	4187d793          	srai	a5,a5,0x18
 168:	0ff7f793          	zext.b	a5,a5
 16c:	fef403a3          	sb	a5,-25(s0)
 170:	fe842783          	lw	a5,-24(s0)
 174:	4107d793          	srai	a5,a5,0x10
 178:	0ff7f793          	zext.b	a5,a5
 17c:	fef40323          	sb	a5,-26(s0)
 180:	fe744783          	lbu	a5,-25(s0)
 184:	0ff7f793          	zext.b	a5,a5
 188:	00078513          	mv	a0,a5
 18c:	2f8000ef          	jal	484 <uart_putc>
 190:	fe644783          	lbu	a5,-26(s0)
 194:	0ff7f793          	zext.b	a5,a5
 198:	00078513          	mv	a0,a5
 19c:	2e8000ef          	jal	484 <uart_putc>
 1a0:	fec42783          	lw	a5,-20(s0)
 1a4:	fff78713          	addi	a4,a5,-1
 1a8:	fee42623          	sw	a4,-20(s0)
 1ac:	f60798e3          	bnez	a5,11c <main+0x48>
 1b0:	00000793          	li	a5,0
 1b4:	00078513          	mv	a0,a5
 1b8:	01c12083          	lw	ra,28(sp)
 1bc:	01812403          	lw	s0,24(sp)
 1c0:	02010113          	addi	sp,sp,32
 1c4:	00008067          	ret

000001c8 <initialize_timer>:
 1c8:	ff010113          	addi	sp,sp,-16
 1cc:	00812623          	sw	s0,12(sp)
 1d0:	01010413          	addi	s0,sp,16
 1d4:	200007b7          	lui	a5,0x20000
 1d8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1dc:	60000737          	lui	a4,0x60000
 1e0:	00e7a023          	sw	a4,0(a5)
 1e4:	200007b7          	lui	a5,0x20000
 1e8:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 1ec:	60000737          	lui	a4,0x60000
 1f0:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 1f4:	00e7a223          	sw	a4,4(a5)
 1f8:	200007b7          	lui	a5,0x20000
 1fc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 200:	60000737          	lui	a4,0x60000
 204:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 208:	00e7a423          	sw	a4,8(a5)
 20c:	200007b7          	lui	a5,0x20000
 210:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 214:	60000737          	lui	a4,0x60000
 218:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 21c:	00e7a623          	sw	a4,12(a5)
 220:	200007b7          	lui	a5,0x20000
 224:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 228:	60000737          	lui	a4,0x60000
 22c:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 230:	00e7a823          	sw	a4,16(a5)
 234:	200007b7          	lui	a5,0x20000
 238:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 23c:	60000737          	lui	a4,0x60000
 240:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 244:	00e7aa23          	sw	a4,20(a5)
 248:	00000013          	nop
 24c:	00c12403          	lw	s0,12(sp)
 250:	01010113          	addi	sp,sp,16
 254:	00008067          	ret

00000258 <_start_timer>:
 258:	fe010113          	addi	sp,sp,-32
 25c:	00812e23          	sw	s0,28(sp)
 260:	02010413          	addi	s0,sp,32
 264:	fea42623          	sw	a0,-20(s0)
 268:	200007b7          	lui	a5,0x20000
 26c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 270:	0087a783          	lw	a5,8(a5)
 274:	fec42703          	lw	a4,-20(s0)
 278:	00e7a023          	sw	a4,0(a5)
 27c:	200007b7          	lui	a5,0x20000
 280:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 284:	0047a783          	lw	a5,4(a5)
 288:	00300713          	li	a4,3
 28c:	00e7a023          	sw	a4,0(a5)
 290:	200007b7          	lui	a5,0x20000
 294:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 298:	0007a783          	lw	a5,0(a5)
 29c:	00100713          	li	a4,1
 2a0:	00e7a023          	sw	a4,0(a5)
 2a4:	00000013          	nop
 2a8:	01c12403          	lw	s0,28(sp)
 2ac:	02010113          	addi	sp,sp,32
 2b0:	00008067          	ret

000002b4 <start_timer>:
 2b4:	fe010113          	addi	sp,sp,-32
 2b8:	00812e23          	sw	s0,28(sp)
 2bc:	02010413          	addi	s0,sp,32
 2c0:	fea42623          	sw	a0,-20(s0)
 2c4:	feb42423          	sw	a1,-24(s0)
 2c8:	200007b7          	lui	a5,0x20000
 2cc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2d0:	0087a783          	lw	a5,8(a5)
 2d4:	fe842703          	lw	a4,-24(s0)
 2d8:	00e7a023          	sw	a4,0(a5)
 2dc:	200007b7          	lui	a5,0x20000
 2e0:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2e4:	0047a783          	lw	a5,4(a5)
 2e8:	00300713          	li	a4,3
 2ec:	00e7a023          	sw	a4,0(a5)
 2f0:	200007b7          	lui	a5,0x20000
 2f4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 2f8:	0007a783          	lw	a5,0(a5)
 2fc:	00100713          	li	a4,1
 300:	00e7a023          	sw	a4,0(a5)
 304:	200007b7          	lui	a5,0x20000
 308:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 30c:	00c7a783          	lw	a5,12(a5)
 310:	11111737          	lui	a4,0x11111
 314:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110aed>
 318:	00e7a023          	sw	a4,0(a5)
 31c:	fec42783          	lw	a5,-20(s0)
 320:	20000737          	lui	a4,0x20000
 324:	02470713          	addi	a4,a4,36 # 20000024 <timer>
 328:	00072803          	lw	a6,0(a4)
 32c:	00472503          	lw	a0,4(a4)
 330:	00872583          	lw	a1,8(a4)
 334:	00c72603          	lw	a2,12(a4)
 338:	01072683          	lw	a3,16(a4)
 33c:	01472703          	lw	a4,20(a4)
 340:	0107a023          	sw	a6,0(a5)
 344:	00a7a223          	sw	a0,4(a5)
 348:	00b7a423          	sw	a1,8(a5)
 34c:	00c7a623          	sw	a2,12(a5)
 350:	00d7a823          	sw	a3,16(a5)
 354:	00e7aa23          	sw	a4,20(a5)
 358:	fec42503          	lw	a0,-20(s0)
 35c:	01c12403          	lw	s0,28(sp)
 360:	02010113          	addi	sp,sp,32
 364:	00008067          	ret

00000368 <delay>:
 368:	fe010113          	addi	sp,sp,-32
 36c:	00112e23          	sw	ra,28(sp)
 370:	00812c23          	sw	s0,24(sp)
 374:	02010413          	addi	s0,sp,32
 378:	fea42623          	sw	a0,-20(s0)
 37c:	000017b7          	lui	a5,0x1
 380:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x114b>
 384:	ed5ff0ef          	jal	258 <_start_timer>
 388:	200007b7          	lui	a5,0x20000
 38c:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 390:	00c7a783          	lw	a5,12(a5)
 394:	fec42703          	lw	a4,-20(s0)
 398:	00e7a023          	sw	a4,0(a5)
 39c:	00000013          	nop
 3a0:	200007b7          	lui	a5,0x20000
 3a4:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3a8:	0107a783          	lw	a5,16(a5)
 3ac:	0007a703          	lw	a4,0(a5)
 3b0:	fec42783          	lw	a5,-20(s0)
 3b4:	fef716e3          	bne	a4,a5,3a0 <delay+0x38>
 3b8:	200007b7          	lui	a5,0x20000
 3bc:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3c0:	0007a783          	lw	a5,0(a5)
 3c4:	0007a023          	sw	zero,0(a5)
 3c8:	00000013          	nop
 3cc:	01c12083          	lw	ra,28(sp)
 3d0:	01812403          	lw	s0,24(sp)
 3d4:	02010113          	addi	sp,sp,32
 3d8:	00008067          	ret

000003dc <get_timer_counter>:
 3dc:	ff010113          	addi	sp,sp,-16
 3e0:	00812623          	sw	s0,12(sp)
 3e4:	01010413          	addi	s0,sp,16
 3e8:	200007b7          	lui	a5,0x20000
 3ec:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 3f0:	0107a783          	lw	a5,16(a5)
 3f4:	0007a783          	lw	a5,0(a5)
 3f8:	00078513          	mv	a0,a5
 3fc:	00c12403          	lw	s0,12(sp)
 400:	01010113          	addi	sp,sp,16
 404:	00008067          	ret

00000408 <end_timer>:
 408:	ff010113          	addi	sp,sp,-16
 40c:	00812623          	sw	s0,12(sp)
 410:	01010413          	addi	s0,sp,16
 414:	200007b7          	lui	a5,0x20000
 418:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 41c:	0007a783          	lw	a5,0(a5)
 420:	0007a023          	sw	zero,0(a5)
 424:	200007b7          	lui	a5,0x20000
 428:	02478793          	addi	a5,a5,36 # 20000024 <timer>
 42c:	0107a783          	lw	a5,16(a5)
 430:	0007a783          	lw	a5,0(a5)
 434:	00078513          	mv	a0,a5
 438:	00c12403          	lw	s0,12(sp)
 43c:	01010113          	addi	sp,sp,16
 440:	00008067          	ret

00000444 <uart_init>:
 444:	fe010113          	addi	sp,sp,-32
 448:	00812e23          	sw	s0,28(sp)
 44c:	02010413          	addi	s0,sp,32
 450:	fea42623          	sw	a0,-20(s0)
 454:	200007b7          	lui	a5,0x20000
 458:	0187a783          	lw	a5,24(a5) # 20000018 <uart_bauddiv>
 45c:	fec42703          	lw	a4,-20(s0)
 460:	00e7a023          	sw	a4,0(a5)
 464:	200007b7          	lui	a5,0x20000
 468:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 46c:	00100713          	li	a4,1
 470:	00e7a023          	sw	a4,0(a5)
 474:	00000013          	nop
 478:	01c12403          	lw	s0,28(sp)
 47c:	02010113          	addi	sp,sp,32
 480:	00008067          	ret

00000484 <uart_putc>:
 484:	fe010113          	addi	sp,sp,-32
 488:	00812e23          	sw	s0,28(sp)
 48c:	02010413          	addi	s0,sp,32
 490:	00050793          	mv	a5,a0
 494:	fef407a3          	sb	a5,-17(s0)
 498:	00000013          	nop
 49c:	200007b7          	lui	a5,0x20000
 4a0:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 4a4:	0007a783          	lw	a5,0(a5)
 4a8:	fe078ae3          	beqz	a5,49c <uart_putc+0x18>
 4ac:	200007b7          	lui	a5,0x20000
 4b0:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 4b4:	fef44703          	lbu	a4,-17(s0)
 4b8:	00e7a023          	sw	a4,0(a5)
 4bc:	200007b7          	lui	a5,0x20000
 4c0:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4c4:	0007a703          	lw	a4,0(a5)
 4c8:	200007b7          	lui	a5,0x20000
 4cc:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4d0:	00276713          	ori	a4,a4,2
 4d4:	00e7a023          	sw	a4,0(a5)
 4d8:	00000013          	nop
 4dc:	01c12403          	lw	s0,28(sp)
 4e0:	02010113          	addi	sp,sp,32
 4e4:	00008067          	ret

000004e8 <uart_puts>:
 4e8:	fd010113          	addi	sp,sp,-48
 4ec:	02112623          	sw	ra,44(sp)
 4f0:	02812423          	sw	s0,40(sp)
 4f4:	03010413          	addi	s0,sp,48
 4f8:	fca42e23          	sw	a0,-36(s0)
 4fc:	fe042623          	sw	zero,-20(s0)
 500:	0280006f          	j	528 <uart_puts+0x40>
 504:	fec42783          	lw	a5,-20(s0)
 508:	fdc42703          	lw	a4,-36(s0)
 50c:	00f707b3          	add	a5,a4,a5
 510:	0007c783          	lbu	a5,0(a5)
 514:	00078513          	mv	a0,a5
 518:	f6dff0ef          	jal	484 <uart_putc>
 51c:	fec42783          	lw	a5,-20(s0)
 520:	00178793          	addi	a5,a5,1
 524:	fef42623          	sw	a5,-20(s0)
 528:	fec42783          	lw	a5,-20(s0)
 52c:	fdc42703          	lw	a4,-36(s0)
 530:	00f707b3          	add	a5,a4,a5
 534:	0007c783          	lbu	a5,0(a5)
 538:	fc0796e3          	bnez	a5,504 <uart_puts+0x1c>
 53c:	00000013          	nop
 540:	00000013          	nop
 544:	02c12083          	lw	ra,44(sp)
 548:	02812403          	lw	s0,40(sp)
 54c:	03010113          	addi	sp,sp,48
 550:	00008067          	ret

00000554 <uart_puti8>:
 554:	fe010113          	addi	sp,sp,-32
 558:	00812e23          	sw	s0,28(sp)
 55c:	02010413          	addi	s0,sp,32
 560:	00050793          	mv	a5,a0
 564:	fef407a3          	sb	a5,-17(s0)
 568:	00000013          	nop
 56c:	200007b7          	lui	a5,0x20000
 570:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 574:	0007a783          	lw	a5,0(a5)
 578:	fe078ae3          	beqz	a5,56c <uart_puti8+0x18>
 57c:	200007b7          	lui	a5,0x20000
 580:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 584:	fef44703          	lbu	a4,-17(s0)
 588:	00e7a023          	sw	a4,0(a5)
 58c:	200007b7          	lui	a5,0x20000
 590:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 594:	0007a703          	lw	a4,0(a5)
 598:	200007b7          	lui	a5,0x20000
 59c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 5a0:	00276713          	ori	a4,a4,2
 5a4:	00e7a023          	sw	a4,0(a5)
 5a8:	00000013          	nop
 5ac:	01c12403          	lw	s0,28(sp)
 5b0:	02010113          	addi	sp,sp,32
 5b4:	00008067          	ret

000005b8 <uart_puti>:
 5b8:	fd010113          	addi	sp,sp,-48
 5bc:	02112623          	sw	ra,44(sp)
 5c0:	02812423          	sw	s0,40(sp)
 5c4:	03010413          	addi	s0,sp,48
 5c8:	fca42e23          	sw	a0,-36(s0)
 5cc:	fe042623          	sw	zero,-20(s0)
 5d0:	0300006f          	j	600 <uart_puti+0x48>
 5d4:	fec42783          	lw	a5,-20(s0)
 5d8:	00379793          	slli	a5,a5,0x3
 5dc:	fdc42703          	lw	a4,-36(s0)
 5e0:	40f757b3          	sra	a5,a4,a5
 5e4:	fef405a3          	sb	a5,-21(s0)
 5e8:	feb44783          	lbu	a5,-21(s0)
 5ec:	00078513          	mv	a0,a5
 5f0:	f65ff0ef          	jal	554 <uart_puti8>
 5f4:	fec42783          	lw	a5,-20(s0)
 5f8:	00178793          	addi	a5,a5,1
 5fc:	fef42623          	sw	a5,-20(s0)
 600:	fec42703          	lw	a4,-20(s0)
 604:	00300793          	li	a5,3
 608:	fce7d6e3          	bge	a5,a4,5d4 <uart_puti+0x1c>
 60c:	00000013          	nop
 610:	00000013          	nop
 614:	02c12083          	lw	ra,44(sp)
 618:	02812403          	lw	s0,40(sp)
 61c:	03010113          	addi	sp,sp,48
 620:	00008067          	ret

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
