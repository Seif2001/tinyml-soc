
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
  84:	62050513          	addi	a0,a0,1568 # 6a0 <_sidata>
  88:	20000597          	auipc	a1,0x20000
  8c:	f7858593          	addi	a1,a1,-136 # 20000000 <gpio_data_2>
  90:	20000617          	auipc	a2,0x20000
  94:	f9460613          	addi	a2,a2,-108 # 20000024 <i2s_data_buffer>
  98:	00c5dc63          	bge	a1,a2,b0 <end_init_data>

0000009c <loop_init_data>:
  9c:	00052683          	lw	a3,0(a0)
  a0:	00d5a023          	sw	a3,0(a1)
  a4:	00450513          	addi	a0,a0,4
  a8:	00458593          	addi	a1,a1,4
  ac:	fec5c8e3          	blt	a1,a2,9c <loop_init_data>

000000b0 <end_init_data>:
  b0:	20000517          	auipc	a0,0x20000
  b4:	f7450513          	addi	a0,a0,-140 # 20000024 <i2s_data_buffer>
  b8:	82c18593          	addi	a1,gp,-2004 # 20000050 <_ebss>
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
  d4:	fc010113          	addi	sp,sp,-64
  d8:	02112e23          	sw	ra,60(sp)
  dc:	02812c23          	sw	s0,56(sp)
  e0:	04010413          	addi	s0,sp,64
  e4:	200007b7          	lui	a5,0x20000
  e8:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
  ec:	00100713          	li	a4,1
  f0:	00e7a023          	sw	a4,0(a5)
  f4:	150000ef          	jal	244 <initialize_timer>
  f8:	27100513          	li	a0,625
  fc:	3c4000ef          	jal	4c0 <uart_init>
 100:	fc040793          	addi	a5,s0,-64
 104:	06400593          	li	a1,100
 108:	00078513          	mv	a0,a5
 10c:	224000ef          	jal	330 <start_timer>
 110:	fe042623          	sw	zero,-20(s0)
 114:	0c40006f          	j	1d8 <main+0x104>
 118:	00000013          	nop
 11c:	200007b7          	lui	a5,0x20000
 120:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_done>
 124:	0007a783          	lw	a5,0(a5)
 128:	fe078ae3          	beqz	a5,11c <main+0x48>
 12c:	200007b7          	lui	a5,0x20000
 130:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 134:	0007a783          	lw	a5,0(a5)
 138:	200007b7          	lui	a5,0x20000
 13c:	02478713          	addi	a4,a5,36 # 20000024 <i2s_data_buffer>
 140:	fec42783          	lw	a5,-20(s0)
 144:	00f707b3          	add	a5,a4,a5
 148:	00078023          	sb	zero,0(a5)
 14c:	200007b7          	lui	a5,0x20000
 150:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 154:	0007a783          	lw	a5,0(a5)
 158:	fec42783          	lw	a5,-20(s0)
 15c:	00278793          	addi	a5,a5,2
 160:	20000737          	lui	a4,0x20000
 164:	02470713          	addi	a4,a4,36 # 20000024 <i2s_data_buffer>
 168:	00f707b3          	add	a5,a4,a5
 16c:	00078023          	sb	zero,0(a5)
 170:	200007b7          	lui	a5,0x20000
 174:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 178:	0007a783          	lw	a5,0(a5)
 17c:	fec42783          	lw	a5,-20(s0)
 180:	00378793          	addi	a5,a5,3
 184:	20000737          	lui	a4,0x20000
 188:	02470713          	addi	a4,a4,36 # 20000024 <i2s_data_buffer>
 18c:	00f707b3          	add	a5,a4,a5
 190:	00078023          	sb	zero,0(a5)
 194:	200007b7          	lui	a5,0x20000
 198:	0107a783          	lw	a5,16(a5) # 20000010 <i2s_data>
 19c:	0007a703          	lw	a4,0(a5)
 1a0:	fec42783          	lw	a5,-20(s0)
 1a4:	00478793          	addi	a5,a5,4
 1a8:	0ff77713          	zext.b	a4,a4
 1ac:	200006b7          	lui	a3,0x20000
 1b0:	02468693          	addi	a3,a3,36 # 20000024 <i2s_data_buffer>
 1b4:	00f687b3          	add	a5,a3,a5
 1b8:	00e78023          	sb	a4,0(a5)
 1bc:	fec42783          	lw	a5,-20(s0)
 1c0:	00478793          	addi	a5,a5,4
 1c4:	fef42623          	sw	a5,-20(s0)
 1c8:	200007b7          	lui	a5,0x20000
 1cc:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 1d0:	fec42703          	lw	a4,-20(s0)
 1d4:	00e7a023          	sw	a4,0(a5)
 1d8:	280000ef          	jal	458 <get_timer_counter>
 1dc:	00050713          	mv	a4,a0
 1e0:	00900793          	li	a5,9
 1e4:	f2e7fae3          	bgeu	a5,a4,118 <main+0x44>
 1e8:	29c000ef          	jal	484 <end_timer>
 1ec:	fe042423          	sw	zero,-24(s0)
 1f0:	0300006f          	j	220 <main+0x14c>
 1f4:	200007b7          	lui	a5,0x20000
 1f8:	02478713          	addi	a4,a5,36 # 20000024 <i2s_data_buffer>
 1fc:	fe842783          	lw	a5,-24(s0)
 200:	00f707b3          	add	a5,a4,a5
 204:	0007c783          	lbu	a5,0(a5)
 208:	0ff7f793          	zext.b	a5,a5
 20c:	00078513          	mv	a0,a5
 210:	2f0000ef          	jal	500 <uart_putc>
 214:	fe842783          	lw	a5,-24(s0)
 218:	00178793          	addi	a5,a5,1
 21c:	fef42423          	sw	a5,-24(s0)
 220:	fe842703          	lw	a4,-24(s0)
 224:	01300793          	li	a5,19
 228:	fce7d6e3          	bge	a5,a4,1f4 <main+0x120>
 22c:	00000793          	li	a5,0
 230:	00078513          	mv	a0,a5
 234:	03c12083          	lw	ra,60(sp)
 238:	03812403          	lw	s0,56(sp)
 23c:	04010113          	addi	sp,sp,64
 240:	00008067          	ret

00000244 <initialize_timer>:
 244:	ff010113          	addi	sp,sp,-16
 248:	00812623          	sw	s0,12(sp)
 24c:	01010413          	addi	s0,sp,16
 250:	200007b7          	lui	a5,0x20000
 254:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 258:	60000737          	lui	a4,0x60000
 25c:	00e7a023          	sw	a4,0(a5)
 260:	200007b7          	lui	a5,0x20000
 264:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 268:	60000737          	lui	a4,0x60000
 26c:	00470713          	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 270:	00e7a223          	sw	a4,4(a5)
 274:	200007b7          	lui	a5,0x20000
 278:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 27c:	60000737          	lui	a4,0x60000
 280:	00870713          	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 284:	00e7a423          	sw	a4,8(a5)
 288:	200007b7          	lui	a5,0x20000
 28c:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 290:	60000737          	lui	a4,0x60000
 294:	00c70713          	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 298:	00e7a623          	sw	a4,12(a5)
 29c:	200007b7          	lui	a5,0x20000
 2a0:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 2a4:	60000737          	lui	a4,0x60000
 2a8:	00f70713          	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 2ac:	00e7a823          	sw	a4,16(a5)
 2b0:	200007b7          	lui	a5,0x20000
 2b4:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 2b8:	60000737          	lui	a4,0x60000
 2bc:	01070713          	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 2c0:	00e7aa23          	sw	a4,20(a5)
 2c4:	00000013          	nop
 2c8:	00c12403          	lw	s0,12(sp)
 2cc:	01010113          	addi	sp,sp,16
 2d0:	00008067          	ret

000002d4 <_start_timer>:
 2d4:	fe010113          	addi	sp,sp,-32
 2d8:	00812e23          	sw	s0,28(sp)
 2dc:	02010413          	addi	s0,sp,32
 2e0:	fea42623          	sw	a0,-20(s0)
 2e4:	200007b7          	lui	a5,0x20000
 2e8:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 2ec:	0087a783          	lw	a5,8(a5)
 2f0:	fec42703          	lw	a4,-20(s0)
 2f4:	00e7a023          	sw	a4,0(a5)
 2f8:	200007b7          	lui	a5,0x20000
 2fc:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 300:	0047a783          	lw	a5,4(a5)
 304:	00300713          	li	a4,3
 308:	00e7a023          	sw	a4,0(a5)
 30c:	200007b7          	lui	a5,0x20000
 310:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 314:	0007a783          	lw	a5,0(a5)
 318:	00100713          	li	a4,1
 31c:	00e7a023          	sw	a4,0(a5)
 320:	00000013          	nop
 324:	01c12403          	lw	s0,28(sp)
 328:	02010113          	addi	sp,sp,32
 32c:	00008067          	ret

00000330 <start_timer>:
 330:	fe010113          	addi	sp,sp,-32
 334:	00812e23          	sw	s0,28(sp)
 338:	02010413          	addi	s0,sp,32
 33c:	fea42623          	sw	a0,-20(s0)
 340:	feb42423          	sw	a1,-24(s0)
 344:	200007b7          	lui	a5,0x20000
 348:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 34c:	0087a783          	lw	a5,8(a5)
 350:	fe842703          	lw	a4,-24(s0)
 354:	00e7a023          	sw	a4,0(a5)
 358:	200007b7          	lui	a5,0x20000
 35c:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 360:	0047a783          	lw	a5,4(a5)
 364:	00300713          	li	a4,3
 368:	00e7a023          	sw	a4,0(a5)
 36c:	200007b7          	lui	a5,0x20000
 370:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 374:	0007a783          	lw	a5,0(a5)
 378:	00100713          	li	a4,1
 37c:	00e7a023          	sw	a4,0(a5)
 380:	200007b7          	lui	a5,0x20000
 384:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 388:	00c7a783          	lw	a5,12(a5)
 38c:	11111737          	lui	a4,0x11111
 390:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110a71>
 394:	00e7a023          	sw	a4,0(a5)
 398:	fec42783          	lw	a5,-20(s0)
 39c:	20000737          	lui	a4,0x20000
 3a0:	03870713          	addi	a4,a4,56 # 20000038 <timer>
 3a4:	00072803          	lw	a6,0(a4)
 3a8:	00472503          	lw	a0,4(a4)
 3ac:	00872583          	lw	a1,8(a4)
 3b0:	00c72603          	lw	a2,12(a4)
 3b4:	01072683          	lw	a3,16(a4)
 3b8:	01472703          	lw	a4,20(a4)
 3bc:	0107a023          	sw	a6,0(a5)
 3c0:	00a7a223          	sw	a0,4(a5)
 3c4:	00b7a423          	sw	a1,8(a5)
 3c8:	00c7a623          	sw	a2,12(a5)
 3cc:	00d7a823          	sw	a3,16(a5)
 3d0:	00e7aa23          	sw	a4,20(a5)
 3d4:	fec42503          	lw	a0,-20(s0)
 3d8:	01c12403          	lw	s0,28(sp)
 3dc:	02010113          	addi	sp,sp,32
 3e0:	00008067          	ret

000003e4 <delay>:
 3e4:	fe010113          	addi	sp,sp,-32
 3e8:	00112e23          	sw	ra,28(sp)
 3ec:	00812c23          	sw	s0,24(sp)
 3f0:	02010413          	addi	s0,sp,32
 3f4:	fea42623          	sw	a0,-20(s0)
 3f8:	000017b7          	lui	a5,0x1
 3fc:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x10cf>
 400:	ed5ff0ef          	jal	2d4 <_start_timer>
 404:	200007b7          	lui	a5,0x20000
 408:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 40c:	00c7a783          	lw	a5,12(a5)
 410:	fec42703          	lw	a4,-20(s0)
 414:	00e7a023          	sw	a4,0(a5)
 418:	00000013          	nop
 41c:	200007b7          	lui	a5,0x20000
 420:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 424:	0107a783          	lw	a5,16(a5)
 428:	0007a703          	lw	a4,0(a5)
 42c:	fec42783          	lw	a5,-20(s0)
 430:	fef716e3          	bne	a4,a5,41c <delay+0x38>
 434:	200007b7          	lui	a5,0x20000
 438:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 43c:	0007a783          	lw	a5,0(a5)
 440:	0007a023          	sw	zero,0(a5)
 444:	00000013          	nop
 448:	01c12083          	lw	ra,28(sp)
 44c:	01812403          	lw	s0,24(sp)
 450:	02010113          	addi	sp,sp,32
 454:	00008067          	ret

00000458 <get_timer_counter>:
 458:	ff010113          	addi	sp,sp,-16
 45c:	00812623          	sw	s0,12(sp)
 460:	01010413          	addi	s0,sp,16
 464:	200007b7          	lui	a5,0x20000
 468:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 46c:	0107a783          	lw	a5,16(a5)
 470:	0007a783          	lw	a5,0(a5)
 474:	00078513          	mv	a0,a5
 478:	00c12403          	lw	s0,12(sp)
 47c:	01010113          	addi	sp,sp,16
 480:	00008067          	ret

00000484 <end_timer>:
 484:	ff010113          	addi	sp,sp,-16
 488:	00812623          	sw	s0,12(sp)
 48c:	01010413          	addi	s0,sp,16
 490:	200007b7          	lui	a5,0x20000
 494:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 498:	0007a783          	lw	a5,0(a5)
 49c:	0007a023          	sw	zero,0(a5)
 4a0:	200007b7          	lui	a5,0x20000
 4a4:	03878793          	addi	a5,a5,56 # 20000038 <timer>
 4a8:	0107a783          	lw	a5,16(a5)
 4ac:	0007a783          	lw	a5,0(a5)
 4b0:	00078513          	mv	a0,a5
 4b4:	00c12403          	lw	s0,12(sp)
 4b8:	01010113          	addi	sp,sp,16
 4bc:	00008067          	ret

000004c0 <uart_init>:
 4c0:	fe010113          	addi	sp,sp,-32
 4c4:	00812e23          	sw	s0,28(sp)
 4c8:	02010413          	addi	s0,sp,32
 4cc:	fea42623          	sw	a0,-20(s0)
 4d0:	200007b7          	lui	a5,0x20000
 4d4:	0187a783          	lw	a5,24(a5) # 20000018 <uart_bauddiv>
 4d8:	fec42703          	lw	a4,-20(s0)
 4dc:	00e7a023          	sw	a4,0(a5)
 4e0:	200007b7          	lui	a5,0x20000
 4e4:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 4e8:	00100713          	li	a4,1
 4ec:	00e7a023          	sw	a4,0(a5)
 4f0:	00000013          	nop
 4f4:	01c12403          	lw	s0,28(sp)
 4f8:	02010113          	addi	sp,sp,32
 4fc:	00008067          	ret

00000500 <uart_putc>:
 500:	fe010113          	addi	sp,sp,-32
 504:	00812e23          	sw	s0,28(sp)
 508:	02010413          	addi	s0,sp,32
 50c:	00050793          	mv	a5,a0
 510:	fef407a3          	sb	a5,-17(s0)
 514:	00000013          	nop
 518:	200007b7          	lui	a5,0x20000
 51c:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 520:	0007a783          	lw	a5,0(a5)
 524:	fe078ae3          	beqz	a5,518 <uart_putc+0x18>
 528:	200007b7          	lui	a5,0x20000
 52c:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 530:	fef44703          	lbu	a4,-17(s0)
 534:	00e7a023          	sw	a4,0(a5)
 538:	200007b7          	lui	a5,0x20000
 53c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 540:	0007a703          	lw	a4,0(a5)
 544:	200007b7          	lui	a5,0x20000
 548:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 54c:	00276713          	ori	a4,a4,2
 550:	00e7a023          	sw	a4,0(a5)
 554:	00000013          	nop
 558:	01c12403          	lw	s0,28(sp)
 55c:	02010113          	addi	sp,sp,32
 560:	00008067          	ret

00000564 <uart_puts>:
 564:	fd010113          	addi	sp,sp,-48
 568:	02112623          	sw	ra,44(sp)
 56c:	02812423          	sw	s0,40(sp)
 570:	03010413          	addi	s0,sp,48
 574:	fca42e23          	sw	a0,-36(s0)
 578:	fe042623          	sw	zero,-20(s0)
 57c:	0280006f          	j	5a4 <uart_puts+0x40>
 580:	fec42783          	lw	a5,-20(s0)
 584:	fdc42703          	lw	a4,-36(s0)
 588:	00f707b3          	add	a5,a4,a5
 58c:	0007c783          	lbu	a5,0(a5)
 590:	00078513          	mv	a0,a5
 594:	f6dff0ef          	jal	500 <uart_putc>
 598:	fec42783          	lw	a5,-20(s0)
 59c:	00178793          	addi	a5,a5,1
 5a0:	fef42623          	sw	a5,-20(s0)
 5a4:	fec42783          	lw	a5,-20(s0)
 5a8:	fdc42703          	lw	a4,-36(s0)
 5ac:	00f707b3          	add	a5,a4,a5
 5b0:	0007c783          	lbu	a5,0(a5)
 5b4:	fc0796e3          	bnez	a5,580 <uart_puts+0x1c>
 5b8:	00000013          	nop
 5bc:	00000013          	nop
 5c0:	02c12083          	lw	ra,44(sp)
 5c4:	02812403          	lw	s0,40(sp)
 5c8:	03010113          	addi	sp,sp,48
 5cc:	00008067          	ret

000005d0 <uart_puti8>:
 5d0:	fe010113          	addi	sp,sp,-32
 5d4:	00812e23          	sw	s0,28(sp)
 5d8:	02010413          	addi	s0,sp,32
 5dc:	00050793          	mv	a5,a0
 5e0:	fef407a3          	sb	a5,-17(s0)
 5e4:	00000013          	nop
 5e8:	200007b7          	lui	a5,0x20000
 5ec:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_status>
 5f0:	0007a783          	lw	a5,0(a5)
 5f4:	fe078ae3          	beqz	a5,5e8 <uart_puti8+0x18>
 5f8:	200007b7          	lui	a5,0x20000
 5fc:	0207a783          	lw	a5,32(a5) # 20000020 <uart_data>
 600:	fef44703          	lbu	a4,-17(s0)
 604:	00e7a023          	sw	a4,0(a5)
 608:	200007b7          	lui	a5,0x20000
 60c:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 610:	0007a703          	lw	a4,0(a5)
 614:	200007b7          	lui	a5,0x20000
 618:	0147a783          	lw	a5,20(a5) # 20000014 <uart_ctrl>
 61c:	00276713          	ori	a4,a4,2
 620:	00e7a023          	sw	a4,0(a5)
 624:	00000013          	nop
 628:	01c12403          	lw	s0,28(sp)
 62c:	02010113          	addi	sp,sp,32
 630:	00008067          	ret

00000634 <uart_puti>:
 634:	fd010113          	addi	sp,sp,-48
 638:	02112623          	sw	ra,44(sp)
 63c:	02812423          	sw	s0,40(sp)
 640:	03010413          	addi	s0,sp,48
 644:	fca42e23          	sw	a0,-36(s0)
 648:	fe042623          	sw	zero,-20(s0)
 64c:	0300006f          	j	67c <uart_puti+0x48>
 650:	fec42783          	lw	a5,-20(s0)
 654:	00379793          	slli	a5,a5,0x3
 658:	fdc42703          	lw	a4,-36(s0)
 65c:	40f757b3          	sra	a5,a4,a5
 660:	fef405a3          	sb	a5,-21(s0)
 664:	feb44783          	lbu	a5,-21(s0)
 668:	00078513          	mv	a0,a5
 66c:	f65ff0ef          	jal	5d0 <uart_puti8>
 670:	fec42783          	lw	a5,-20(s0)
 674:	00178793          	addi	a5,a5,1
 678:	fef42623          	sw	a5,-20(s0)
 67c:	fec42703          	lw	a4,-20(s0)
 680:	00300793          	li	a5,3
 684:	fce7d6e3          	bge	a5,a4,650 <uart_puti+0x1c>
 688:	00000013          	nop
 68c:	00000013          	nop
 690:	02c12083          	lw	ra,44(sp)
 694:	02812403          	lw	s0,40(sp)
 698:	03010113          	addi	sp,sp,48
 69c:	00008067          	ret

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
