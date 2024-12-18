
interupts.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	4081                	li	ra,0
   2:	20002117          	auipc	sp,0x20002
   6:	ffe10113          	addi	sp,sp,-2 # 20002000 <_stack>
   a:	4181                	li	gp,0
   c:	4201                	li	tp,0
   e:	4281                	li	t0,0
  10:	4301                	li	t1,0
  12:	4381                	li	t2,0
  14:	4401                	li	s0,0
  16:	4481                	li	s1,0
  18:	4501                	li	a0,0
  1a:	4581                	li	a1,0
  1c:	4601                	li	a2,0
  1e:	4681                	li	a3,0
  20:	4701                	li	a4,0
  22:	4781                	li	a5,0
  24:	4801                	li	a6,0
  26:	4881                	li	a7,0
  28:	4901                	li	s2,0
  2a:	4981                	li	s3,0
  2c:	4a01                	li	s4,0
  2e:	4a81                	li	s5,0
  30:	4b01                	li	s6,0
  32:	4b81                	li	s7,0
  34:	4c01                	li	s8,0
  36:	4c81                	li	s9,0
  38:	4d01                	li	s10,0
  3a:	4d81                	li	s11,0
  3c:	4e01                	li	t3,0
  3e:	4e81                	li	t4,0
  40:	4f01                	li	t5,0
  42:	4f81                	li	t6,0
  44:	00000517          	auipc	a0,0x0
  48:	41050513          	addi	a0,a0,1040 # 454 <_sidata>
  4c:	20000597          	auipc	a1,0x20000
  50:	fb458593          	addi	a1,a1,-76 # 20000000 <gpio_data_2>
  54:	20000617          	auipc	a2,0x20000
  58:	fc460613          	addi	a2,a2,-60 # 20000018 <timer>
  5c:	00c5d863          	bge	a1,a2,6c <end_init_data>

00000060 <loop_init_data>:
  60:	4114                	lw	a3,0(a0)
  62:	c194                	sw	a3,0(a1)
  64:	0511                	addi	a0,a0,4
  66:	0591                	addi	a1,a1,4
  68:	fec5cce3          	blt	a1,a2,60 <loop_init_data>

0000006c <end_init_data>:
  6c:	20000517          	auipc	a0,0x20000
  70:	fac50513          	addi	a0,a0,-84 # 20000018 <timer>
  74:	81818593          	addi	a1,gp,-2024 # 20000030 <_ebss>
  78:	00b55763          	bge	a0,a1,86 <end_init_bss>

0000007c <loop_init_bss>:
  7c:	00052023          	sw	zero,0(a0)
  80:	0511                	addi	a0,a0,4
  82:	feb54de3          	blt	a0,a1,7c <loop_init_bss>

00000086 <end_init_bss>:
  86:	2071                	jal	112 <main>

00000088 <loopy>:
  88:	a001                	j	88 <loopy>

0000008a <isr>:
  8a:	715d                	addi	sp,sp,-80
  8c:	c686                	sw	ra,76(sp)
  8e:	c496                	sw	t0,72(sp)
  90:	c29a                	sw	t1,68(sp)
  92:	c09e                	sw	t2,64(sp)
  94:	de22                	sw	s0,60(sp)
  96:	dc2a                	sw	a0,56(sp)
  98:	da2e                	sw	a1,52(sp)
  9a:	d832                	sw	a2,48(sp)
  9c:	d636                	sw	a3,44(sp)
  9e:	d43a                	sw	a4,40(sp)
  a0:	d23e                	sw	a5,36(sp)
  a2:	d042                	sw	a6,32(sp)
  a4:	ce46                	sw	a7,28(sp)
  a6:	cc72                	sw	t3,24(sp)
  a8:	ca76                	sw	t4,20(sp)
  aa:	c87a                	sw	t5,16(sp)
  ac:	c67e                	sw	t6,12(sp)
  ae:	0880                	addi	s0,sp,80
  b0:	450d                	li	a0,3
  b2:	24a9                	jal	2fc <uart_init>
  b4:	45000513          	li	a0,1104
  b8:	2c65                	jal	370 <uart_puts>
  ba:	0001                	nop
  bc:	40b6                	lw	ra,76(sp)
  be:	42a6                	lw	t0,72(sp)
  c0:	4316                	lw	t1,68(sp)
  c2:	4386                	lw	t2,64(sp)
  c4:	5472                	lw	s0,60(sp)
  c6:	5562                	lw	a0,56(sp)
  c8:	55d2                	lw	a1,52(sp)
  ca:	5642                	lw	a2,48(sp)
  cc:	56b2                	lw	a3,44(sp)
  ce:	5722                	lw	a4,40(sp)
  d0:	5792                	lw	a5,36(sp)
  d2:	5802                	lw	a6,32(sp)
  d4:	48f2                	lw	a7,28(sp)
  d6:	4e62                	lw	t3,24(sp)
  d8:	4ed2                	lw	t4,20(sp)
  da:	4f42                	lw	t5,16(sp)
  dc:	4fb2                	lw	t6,12(sp)
  de:	6161                	addi	sp,sp,80
  e0:	30200073          	mret

000000e4 <setup_mtvec>:
  e4:	7179                	addi	sp,sp,-48
  e6:	d622                	sw	s0,44(sp)
  e8:	1800                	addi	s0,sp,48
  ea:	fca42e23          	sw	a0,-36(s0)
  ee:	fcb42c23          	sw	a1,-40(s0)
  f2:	fdc42783          	lw	a5,-36(s0)
  f6:	fef42623          	sw	a5,-20(s0)
  fa:	fec42783          	lw	a5,-20(s0)
  fe:	30579073          	csrw	mtvec,a5
 102:	30046073          	csrsi	mstatus,8
 106:	3420e073          	csrsi	mcause,1
 10a:	0001                	nop
 10c:	5432                	lw	s0,44(sp)
 10e:	6145                	addi	sp,sp,48
 110:	8082                	ret

00000112 <main>:
 112:	1141                	addi	sp,sp,-16
 114:	c606                	sw	ra,12(sp)
 116:	c422                	sw	s0,8(sp)
 118:	0800                	addi	s0,sp,16
 11a:	4581                	li	a1,0
 11c:	08a00513          	li	a0,138
 120:	37d1                	jal	e4 <setup_mtvec>
 122:	200007b7          	lui	a5,0x20000
 126:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 12a:	577d                	li	a4,-1
 12c:	c398                	sw	a4,0(a5)
 12e:	200007b7          	lui	a5,0x20000
 132:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 136:	0007a023          	sw	zero,0(a5)
 13a:	0001                	nop
 13c:	bffd                	j	13a <main+0x28>

0000013e <initialize_timer>:
 13e:	1141                	addi	sp,sp,-16
 140:	c622                	sw	s0,12(sp)
 142:	0800                	addi	s0,sp,16
 144:	200007b7          	lui	a5,0x20000
 148:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 14c:	60000737          	lui	a4,0x60000
 150:	c398                	sw	a4,0(a5)
 152:	200007b7          	lui	a5,0x20000
 156:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 15a:	60000737          	lui	a4,0x60000
 15e:	0711                	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 160:	c3d8                	sw	a4,4(a5)
 162:	200007b7          	lui	a5,0x20000
 166:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 16a:	60000737          	lui	a4,0x60000
 16e:	0721                	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 170:	c798                	sw	a4,8(a5)
 172:	200007b7          	lui	a5,0x20000
 176:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 17a:	60000737          	lui	a4,0x60000
 17e:	0731                	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 180:	c7d8                	sw	a4,12(a5)
 182:	200007b7          	lui	a5,0x20000
 186:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 18a:	60000737          	lui	a4,0x60000
 18e:	073d                	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 190:	cb98                	sw	a4,16(a5)
 192:	200007b7          	lui	a5,0x20000
 196:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 19a:	60000737          	lui	a4,0x60000
 19e:	0741                	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 1a0:	cbd8                	sw	a4,20(a5)
 1a2:	0001                	nop
 1a4:	4432                	lw	s0,12(sp)
 1a6:	0141                	addi	sp,sp,16
 1a8:	8082                	ret

000001aa <_start_timer>:
 1aa:	1101                	addi	sp,sp,-32
 1ac:	ce22                	sw	s0,28(sp)
 1ae:	1000                	addi	s0,sp,32
 1b0:	fea42623          	sw	a0,-20(s0)
 1b4:	200007b7          	lui	a5,0x20000
 1b8:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 1bc:	479c                	lw	a5,8(a5)
 1be:	fec42703          	lw	a4,-20(s0)
 1c2:	c398                	sw	a4,0(a5)
 1c4:	200007b7          	lui	a5,0x20000
 1c8:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 1cc:	43dc                	lw	a5,4(a5)
 1ce:	470d                	li	a4,3
 1d0:	c398                	sw	a4,0(a5)
 1d2:	200007b7          	lui	a5,0x20000
 1d6:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 1da:	439c                	lw	a5,0(a5)
 1dc:	4705                	li	a4,1
 1de:	c398                	sw	a4,0(a5)
 1e0:	0001                	nop
 1e2:	4472                	lw	s0,28(sp)
 1e4:	6105                	addi	sp,sp,32
 1e6:	8082                	ret

000001e8 <start_timer>:
 1e8:	1101                	addi	sp,sp,-32
 1ea:	ce22                	sw	s0,28(sp)
 1ec:	1000                	addi	s0,sp,32
 1ee:	fea42623          	sw	a0,-20(s0)
 1f2:	feb42423          	sw	a1,-24(s0)
 1f6:	200007b7          	lui	a5,0x20000
 1fa:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 1fe:	479c                	lw	a5,8(a5)
 200:	fe842703          	lw	a4,-24(s0)
 204:	c398                	sw	a4,0(a5)
 206:	200007b7          	lui	a5,0x20000
 20a:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 20e:	43dc                	lw	a5,4(a5)
 210:	470d                	li	a4,3
 212:	c398                	sw	a4,0(a5)
 214:	200007b7          	lui	a5,0x20000
 218:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 21c:	439c                	lw	a5,0(a5)
 21e:	4705                	li	a4,1
 220:	c398                	sw	a4,0(a5)
 222:	200007b7          	lui	a5,0x20000
 226:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 22a:	47dc                	lw	a5,12(a5)
 22c:	11111737          	lui	a4,0x11111
 230:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110cbd>
 234:	c398                	sw	a4,0(a5)
 236:	fec42783          	lw	a5,-20(s0)
 23a:	20000737          	lui	a4,0x20000
 23e:	01870713          	addi	a4,a4,24 # 20000018 <timer>
 242:	00072803          	lw	a6,0(a4)
 246:	4348                	lw	a0,4(a4)
 248:	470c                	lw	a1,8(a4)
 24a:	4750                	lw	a2,12(a4)
 24c:	4b14                	lw	a3,16(a4)
 24e:	4b58                	lw	a4,20(a4)
 250:	0107a023          	sw	a6,0(a5)
 254:	c3c8                	sw	a0,4(a5)
 256:	c78c                	sw	a1,8(a5)
 258:	c7d0                	sw	a2,12(a5)
 25a:	cb94                	sw	a3,16(a5)
 25c:	cbd8                	sw	a4,20(a5)
 25e:	fec42503          	lw	a0,-20(s0)
 262:	4472                	lw	s0,28(sp)
 264:	6105                	addi	sp,sp,32
 266:	8082                	ret

00000268 <delay>:
 268:	1101                	addi	sp,sp,-32
 26a:	ce06                	sw	ra,28(sp)
 26c:	cc22                	sw	s0,24(sp)
 26e:	1000                	addi	s0,sp,32
 270:	fea42623          	sw	a0,-20(s0)
 274:	6785                	lui	a5,0x1
 276:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x131b>
 27a:	3f05                	jal	1aa <_start_timer>
 27c:	200007b7          	lui	a5,0x20000
 280:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 284:	47dc                	lw	a5,12(a5)
 286:	fec42703          	lw	a4,-20(s0)
 28a:	c398                	sw	a4,0(a5)
 28c:	0001                	nop
 28e:	200007b7          	lui	a5,0x20000
 292:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 296:	4b9c                	lw	a5,16(a5)
 298:	4398                	lw	a4,0(a5)
 29a:	fec42783          	lw	a5,-20(s0)
 29e:	fef718e3          	bne	a4,a5,28e <delay+0x26>
 2a2:	200007b7          	lui	a5,0x20000
 2a6:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 2aa:	439c                	lw	a5,0(a5)
 2ac:	0007a023          	sw	zero,0(a5)
 2b0:	0001                	nop
 2b2:	40f2                	lw	ra,28(sp)
 2b4:	4462                	lw	s0,24(sp)
 2b6:	6105                	addi	sp,sp,32
 2b8:	8082                	ret

000002ba <get_timer_counter>:
 2ba:	1141                	addi	sp,sp,-16
 2bc:	c622                	sw	s0,12(sp)
 2be:	0800                	addi	s0,sp,16
 2c0:	200007b7          	lui	a5,0x20000
 2c4:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 2c8:	4b9c                	lw	a5,16(a5)
 2ca:	439c                	lw	a5,0(a5)
 2cc:	853e                	mv	a0,a5
 2ce:	4432                	lw	s0,12(sp)
 2d0:	0141                	addi	sp,sp,16
 2d2:	8082                	ret

000002d4 <end_timer>:
 2d4:	1141                	addi	sp,sp,-16
 2d6:	c622                	sw	s0,12(sp)
 2d8:	0800                	addi	s0,sp,16
 2da:	200007b7          	lui	a5,0x20000
 2de:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 2e2:	439c                	lw	a5,0(a5)
 2e4:	0007a023          	sw	zero,0(a5)
 2e8:	200007b7          	lui	a5,0x20000
 2ec:	01878793          	addi	a5,a5,24 # 20000018 <timer>
 2f0:	4b9c                	lw	a5,16(a5)
 2f2:	439c                	lw	a5,0(a5)
 2f4:	853e                	mv	a0,a5
 2f6:	4432                	lw	s0,12(sp)
 2f8:	0141                	addi	sp,sp,16
 2fa:	8082                	ret

000002fc <uart_init>:
 2fc:	1101                	addi	sp,sp,-32
 2fe:	ce22                	sw	s0,28(sp)
 300:	1000                	addi	s0,sp,32
 302:	fea42623          	sw	a0,-20(s0)
 306:	200007b7          	lui	a5,0x20000
 30a:	00c7a783          	lw	a5,12(a5) # 2000000c <uart_bauddiv>
 30e:	fec42703          	lw	a4,-20(s0)
 312:	c398                	sw	a4,0(a5)
 314:	200007b7          	lui	a5,0x20000
 318:	0087a783          	lw	a5,8(a5) # 20000008 <uart_ctrl>
 31c:	4705                	li	a4,1
 31e:	c398                	sw	a4,0(a5)
 320:	0001                	nop
 322:	4472                	lw	s0,28(sp)
 324:	6105                	addi	sp,sp,32
 326:	8082                	ret

00000328 <uart_putc>:
 328:	1101                	addi	sp,sp,-32
 32a:	ce22                	sw	s0,28(sp)
 32c:	1000                	addi	s0,sp,32
 32e:	87aa                	mv	a5,a0
 330:	fef407a3          	sb	a5,-17(s0)
 334:	0001                	nop
 336:	200007b7          	lui	a5,0x20000
 33a:	0107a783          	lw	a5,16(a5) # 20000010 <uart_status>
 33e:	439c                	lw	a5,0(a5)
 340:	dbfd                	beqz	a5,336 <uart_putc+0xe>
 342:	200007b7          	lui	a5,0x20000
 346:	0147a783          	lw	a5,20(a5) # 20000014 <uart_data>
 34a:	fef44703          	lbu	a4,-17(s0)
 34e:	c398                	sw	a4,0(a5)
 350:	200007b7          	lui	a5,0x20000
 354:	0087a783          	lw	a5,8(a5) # 20000008 <uart_ctrl>
 358:	4398                	lw	a4,0(a5)
 35a:	200007b7          	lui	a5,0x20000
 35e:	0087a783          	lw	a5,8(a5) # 20000008 <uart_ctrl>
 362:	00276713          	ori	a4,a4,2
 366:	c398                	sw	a4,0(a5)
 368:	0001                	nop
 36a:	4472                	lw	s0,28(sp)
 36c:	6105                	addi	sp,sp,32
 36e:	8082                	ret

00000370 <uart_puts>:
 370:	7179                	addi	sp,sp,-48
 372:	d606                	sw	ra,44(sp)
 374:	d422                	sw	s0,40(sp)
 376:	1800                	addi	s0,sp,48
 378:	fca42e23          	sw	a0,-36(s0)
 37c:	fe042623          	sw	zero,-20(s0)
 380:	a839                	j	39e <uart_puts+0x2e>
 382:	fec42783          	lw	a5,-20(s0)
 386:	fdc42703          	lw	a4,-36(s0)
 38a:	97ba                	add	a5,a5,a4
 38c:	0007c783          	lbu	a5,0(a5)
 390:	853e                	mv	a0,a5
 392:	3f59                	jal	328 <uart_putc>
 394:	fec42783          	lw	a5,-20(s0)
 398:	0785                	addi	a5,a5,1
 39a:	fef42623          	sw	a5,-20(s0)
 39e:	fec42783          	lw	a5,-20(s0)
 3a2:	fdc42703          	lw	a4,-36(s0)
 3a6:	97ba                	add	a5,a5,a4
 3a8:	0007c783          	lbu	a5,0(a5)
 3ac:	fbf9                	bnez	a5,382 <uart_puts+0x12>
 3ae:	0001                	nop
 3b0:	0001                	nop
 3b2:	50b2                	lw	ra,44(sp)
 3b4:	5422                	lw	s0,40(sp)
 3b6:	6145                	addi	sp,sp,48
 3b8:	8082                	ret

000003ba <uart_puti8>:
 3ba:	1101                	addi	sp,sp,-32
 3bc:	ce22                	sw	s0,28(sp)
 3be:	1000                	addi	s0,sp,32
 3c0:	87aa                	mv	a5,a0
 3c2:	fef407a3          	sb	a5,-17(s0)
 3c6:	0001                	nop
 3c8:	200007b7          	lui	a5,0x20000
 3cc:	0107a783          	lw	a5,16(a5) # 20000010 <uart_status>
 3d0:	439c                	lw	a5,0(a5)
 3d2:	dbfd                	beqz	a5,3c8 <uart_puti8+0xe>
 3d4:	200007b7          	lui	a5,0x20000
 3d8:	0147a783          	lw	a5,20(a5) # 20000014 <uart_data>
 3dc:	fef44703          	lbu	a4,-17(s0)
 3e0:	c398                	sw	a4,0(a5)
 3e2:	200007b7          	lui	a5,0x20000
 3e6:	0087a783          	lw	a5,8(a5) # 20000008 <uart_ctrl>
 3ea:	4398                	lw	a4,0(a5)
 3ec:	200007b7          	lui	a5,0x20000
 3f0:	0087a783          	lw	a5,8(a5) # 20000008 <uart_ctrl>
 3f4:	00276713          	ori	a4,a4,2
 3f8:	c398                	sw	a4,0(a5)
 3fa:	0001                	nop
 3fc:	4472                	lw	s0,28(sp)
 3fe:	6105                	addi	sp,sp,32
 400:	8082                	ret

00000402 <uart_puti>:
 402:	7179                	addi	sp,sp,-48
 404:	d606                	sw	ra,44(sp)
 406:	d422                	sw	s0,40(sp)
 408:	1800                	addi	s0,sp,48
 40a:	fca42e23          	sw	a0,-36(s0)
 40e:	fe042623          	sw	zero,-20(s0)
 412:	a01d                	j	438 <uart_puti+0x36>
 414:	fec42783          	lw	a5,-20(s0)
 418:	078e                	slli	a5,a5,0x3
 41a:	fdc42703          	lw	a4,-36(s0)
 41e:	40f757b3          	sra	a5,a4,a5
 422:	fef405a3          	sb	a5,-21(s0)
 426:	feb44783          	lbu	a5,-21(s0)
 42a:	853e                	mv	a0,a5
 42c:	3779                	jal	3ba <uart_puti8>
 42e:	fec42783          	lw	a5,-20(s0)
 432:	0785                	addi	a5,a5,1
 434:	fef42623          	sw	a5,-20(s0)
 438:	fec42703          	lw	a4,-20(s0)
 43c:	478d                	li	a5,3
 43e:	fce7dbe3          	bge	a5,a4,414 <uart_puti+0x12>
 442:	0001                	nop
 444:	0001                	nop
 446:	50b2                	lw	ra,44(sp)
 448:	5422                	lw	s0,40(sp)
 44a:	6145                	addi	sp,sp,48
 44c:	8082                	ret
 44e:	0000                	unimp
 450:	5349                	li	t1,-14
 452:	0052                	c.slli	zero,0x14

Disassembly of section .data:

20000000 <gpio_data_2>:
20000000:	0000                	unimp
20000002:	4200                	lw	s0,0(a2)

20000004 <gpio_oe_2>:
20000004:	0004                	.insn	2, 0x0004
20000006:	4200                	lw	s0,0(a2)

20000008 <uart_ctrl>:
20000008:	0000                	unimp
2000000a:	5000                	lw	s0,32(s0)

2000000c <uart_bauddiv>:
2000000c:	0004                	.insn	2, 0x0004
2000000e:	5000                	lw	s0,32(s0)

20000010 <uart_status>:
20000010:	0008                	.insn	2, 0x0008
20000012:	5000                	lw	s0,32(s0)

20000014 <uart_data>:
20000014:	000c                	.insn	2, 0x000c
20000016:	5000                	lw	s0,32(s0)

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	5341                	li	t1,-16
   2:	0000                	unimp
   4:	7200                	.insn	2, 0x7200
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <start+0x14>
   c:	0049                	c.nop	18
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	li	t5,-20
  1c:	326d                	jal	fffff9c6 <_stack+0xdfffd9c6>
  1e:	3070                	.insn	2, 0x3070
  20:	615f 7032 5f31      	.insn	6, 0x5f317032615f
  26:	30703263          	.insn	4, 0x30703263
  2a:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  30:	7032                	.insn	2, 0x7032
  32:	5f30                	lw	a2,120(a4)
  34:	6d7a                	.insn	2, 0x6d7a
  36:	756d                	lui	a0,0xffffb
  38:	316c                	.insn	2, 0x316c
  3a:	3070                	.insn	2, 0x3070
  3c:	7a5f 6161 6f6d      	.insn	6, 0x6f6d61617a5f
  42:	7031                	c.lui	zero,0xfffec
  44:	5f30                	lw	a2,120(a4)
  46:	617a                	.insn	2, 0x617a
  48:	726c                	.insn	2, 0x726c
  4a:	70316373          	csrrsi	t1,0x703,2
  4e:	0030                	addi	a2,sp,8
  50:	0108                	addi	a0,sp,128
  52:	0b0a                	slli	s6,s6,0x2

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	lui	s0,0xc
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	jal	1c <start+0x1c>
  14:	3331                	jal	fffffd20 <_stack+0xdfffdd20>
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...
