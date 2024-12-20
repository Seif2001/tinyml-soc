
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
  48:	49050513          	addi	a0,a0,1168 # 4d4 <_sidata>
  4c:	20000597          	auipc	a1,0x20000
  50:	fb458593          	addi	a1,a1,-76 # 20000000 <gpio_data_2>
  54:	20000617          	auipc	a2,0x20000
  58:	fd460613          	addi	a2,a2,-44 # 20000028 <timer>
  5c:	00c5d863          	bge	a1,a2,6c <end_init_data>

00000060 <loop_init_data>:
  60:	4114                	lw	a3,0(a0)
  62:	c194                	sw	a3,0(a1)
  64:	0511                	addi	a0,a0,4
  66:	0591                	addi	a1,a1,4
  68:	fec5cce3          	blt	a1,a2,60 <loop_init_data>

0000006c <end_init_data>:
  6c:	20000517          	auipc	a0,0x20000
  70:	fbc50513          	addi	a0,a0,-68 # 20000028 <timer>
  74:	81c18593          	addi	a1,gp,-2020 # 20000044 <_ebss>
  78:	00b55763          	bge	a0,a1,86 <end_init_bss>

0000007c <loop_init_bss>:
  7c:	00052023          	sw	zero,0(a0)
  80:	0511                	addi	a0,a0,4
  82:	feb54de3          	blt	a0,a1,7c <loop_init_bss>

00000086 <end_init_bss>:
  86:	287d                	jal	144 <main>

00000088 <loopy>:
  88:	a001                	j	88 <loopy>

0000008a <isFIFOEmpty>:
  8a:	1141                	addi	sp,sp,-16
  8c:	c622                	sw	s0,12(sp)
  8e:	0800                	addi	s0,sp,16
  90:	200007b7          	lui	a5,0x20000
  94:	0147a783          	lw	a5,20(a5) # 20000014 <i2s_status>
  98:	439c                	lw	a5,0(a5)
  9a:	17fd                	addi	a5,a5,-1
  9c:	0017b793          	seqz	a5,a5
  a0:	0ff7f793          	zext.b	a5,a5
  a4:	853e                	mv	a0,a5
  a6:	4432                	lw	s0,12(sp)
  a8:	0141                	addi	sp,sp,16
  aa:	8082                	ret

000000ac <mret>:
  ac:	1141                	addi	sp,sp,-16
  ae:	c622                	sw	s0,12(sp)
  b0:	0800                	addi	s0,sp,16
  b2:	30200073          	mret
  b6:	0001                	nop
  b8:	4432                	lw	s0,12(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret

000000be <isr>:
  be:	715d                	addi	sp,sp,-80
  c0:	c686                	sw	ra,76(sp)
  c2:	c496                	sw	t0,72(sp)
  c4:	c29a                	sw	t1,68(sp)
  c6:	c09e                	sw	t2,64(sp)
  c8:	de22                	sw	s0,60(sp)
  ca:	dc2a                	sw	a0,56(sp)
  cc:	da2e                	sw	a1,52(sp)
  ce:	d832                	sw	a2,48(sp)
  d0:	d636                	sw	a3,44(sp)
  d2:	d43a                	sw	a4,40(sp)
  d4:	d23e                	sw	a5,36(sp)
  d6:	d042                	sw	a6,32(sp)
  d8:	ce46                	sw	a7,28(sp)
  da:	cc72                	sw	t3,24(sp)
  dc:	ca76                	sw	t4,20(sp)
  de:	c87a                	sw	t5,16(sp)
  e0:	c67e                	sw	t6,12(sp)
  e2:	0880                	addi	s0,sp,80
  e4:	4705                	li	a4,1
  e6:	80e1ac23          	sw	a4,-2024(gp) # 20000040 <flag>
  ea:	37c9                	jal	ac <mret>
  ec:	0001                	nop
  ee:	40b6                	lw	ra,76(sp)
  f0:	42a6                	lw	t0,72(sp)
  f2:	4316                	lw	t1,68(sp)
  f4:	4386                	lw	t2,64(sp)
  f6:	5472                	lw	s0,60(sp)
  f8:	5562                	lw	a0,56(sp)
  fa:	55d2                	lw	a1,52(sp)
  fc:	5642                	lw	a2,48(sp)
  fe:	56b2                	lw	a3,44(sp)
 100:	5722                	lw	a4,40(sp)
 102:	5792                	lw	a5,36(sp)
 104:	5802                	lw	a6,32(sp)
 106:	48f2                	lw	a7,28(sp)
 108:	4e62                	lw	t3,24(sp)
 10a:	4ed2                	lw	t4,20(sp)
 10c:	4f42                	lw	t5,16(sp)
 10e:	4fb2                	lw	t6,12(sp)
 110:	6161                	addi	sp,sp,80
 112:	30200073          	mret

00000116 <setup_mtvec>:
 116:	7179                	addi	sp,sp,-48
 118:	d622                	sw	s0,44(sp)
 11a:	1800                	addi	s0,sp,48
 11c:	fca42e23          	sw	a0,-36(s0)
 120:	fcb42c23          	sw	a1,-40(s0)
 124:	fdc42783          	lw	a5,-36(s0)
 128:	fef42623          	sw	a5,-20(s0)
 12c:	fec42783          	lw	a5,-20(s0)
 130:	30579073          	csrw	mtvec,a5
 134:	30046073          	csrsi	mstatus,8
 138:	30446073          	csrsi	mie,8
 13c:	0001                	nop
 13e:	5432                	lw	s0,44(sp)
 140:	6145                	addi	sp,sp,48
 142:	8082                	ret

00000144 <main>:
 144:	1101                	addi	sp,sp,-32
 146:	ce06                	sw	ra,28(sp)
 148:	cc22                	sw	s0,24(sp)
 14a:	1000                	addi	s0,sp,32
 14c:	4581                	li	a1,0
 14e:	0be00513          	li	a0,190
 152:	37d1                	jal	116 <setup_mtvec>
 154:	200007b7          	lui	a5,0x20000
 158:	0087a783          	lw	a5,8(a5) # 20000008 <i2s_en>
 15c:	4725                	li	a4,9
 15e:	c398                	sw	a4,0(a5)
 160:	200007b7          	lui	a5,0x20000
 164:	0047a783          	lw	a5,4(a5) # 20000004 <gpio_oe_2>
 168:	577d                	li	a4,-1
 16a:	c398                	sw	a4,0(a5)
 16c:	450d                	li	a0,3
 16e:	2c09                	jal	380 <uart_init>
 170:	8181a703          	lw	a4,-2024(gp) # 20000040 <flag>
 174:	4785                	li	a5,1
 176:	02f71e63          	bne	a4,a5,1b2 <main+0x6e>
 17a:	30006073          	csrsi	mstatus,0
 17e:	200007b7          	lui	a5,0x20000
 182:	00c7a783          	lw	a5,12(a5) # 2000000c <i2s_data>
 186:	439c                	lw	a5,0(a5)
 188:	fef42623          	sw	a5,-20(s0)
 18c:	200007b7          	lui	a5,0x20000
 190:	0147a783          	lw	a5,20(a5) # 20000014 <i2s_status>
 194:	439c                	lw	a5,0(a5)
 196:	fef42223          	sw	a5,-28(s0)
 19a:	fe442703          	lw	a4,-28(s0)
 19e:	200007b7          	lui	a5,0x20000
 1a2:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 1a6:	c398                	sw	a4,0(a5)
 1a8:	30046073          	csrsi	mstatus,8
 1ac:	8001ac23          	sw	zero,-2024(gp) # 20000040 <flag>
 1b0:	b7c1                	j	170 <main+0x2c>
 1b2:	200007b7          	lui	a5,0x20000
 1b6:	0007a783          	lw	a5,0(a5) # 20000000 <gpio_data_2>
 1ba:	10000713          	li	a4,256
 1be:	c398                	sw	a4,0(a5)
 1c0:	bf45                	j	170 <main+0x2c>

000001c2 <initialize_timer>:
 1c2:	1141                	addi	sp,sp,-16
 1c4:	c622                	sw	s0,12(sp)
 1c6:	0800                	addi	s0,sp,16
 1c8:	200007b7          	lui	a5,0x20000
 1cc:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1d0:	60000737          	lui	a4,0x60000
 1d4:	c398                	sw	a4,0(a5)
 1d6:	200007b7          	lui	a5,0x20000
 1da:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1de:	60000737          	lui	a4,0x60000
 1e2:	0711                	addi	a4,a4,4 # 60000004 <_stack+0x3fffe004>
 1e4:	c3d8                	sw	a4,4(a5)
 1e6:	200007b7          	lui	a5,0x20000
 1ea:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1ee:	60000737          	lui	a4,0x60000
 1f2:	0721                	addi	a4,a4,8 # 60000008 <_stack+0x3fffe008>
 1f4:	c798                	sw	a4,8(a5)
 1f6:	200007b7          	lui	a5,0x20000
 1fa:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 1fe:	60000737          	lui	a4,0x60000
 202:	0731                	addi	a4,a4,12 # 6000000c <_stack+0x3fffe00c>
 204:	c7d8                	sw	a4,12(a5)
 206:	200007b7          	lui	a5,0x20000
 20a:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 20e:	60000737          	lui	a4,0x60000
 212:	073d                	addi	a4,a4,15 # 6000000f <_stack+0x3fffe00f>
 214:	cb98                	sw	a4,16(a5)
 216:	200007b7          	lui	a5,0x20000
 21a:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 21e:	60000737          	lui	a4,0x60000
 222:	0741                	addi	a4,a4,16 # 60000010 <_stack+0x3fffe010>
 224:	cbd8                	sw	a4,20(a5)
 226:	0001                	nop
 228:	4432                	lw	s0,12(sp)
 22a:	0141                	addi	sp,sp,16
 22c:	8082                	ret

0000022e <_start_timer>:
 22e:	1101                	addi	sp,sp,-32
 230:	ce22                	sw	s0,28(sp)
 232:	1000                	addi	s0,sp,32
 234:	fea42623          	sw	a0,-20(s0)
 238:	200007b7          	lui	a5,0x20000
 23c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 240:	479c                	lw	a5,8(a5)
 242:	fec42703          	lw	a4,-20(s0)
 246:	c398                	sw	a4,0(a5)
 248:	200007b7          	lui	a5,0x20000
 24c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 250:	43dc                	lw	a5,4(a5)
 252:	470d                	li	a4,3
 254:	c398                	sw	a4,0(a5)
 256:	200007b7          	lui	a5,0x20000
 25a:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 25e:	439c                	lw	a5,0(a5)
 260:	4705                	li	a4,1
 262:	c398                	sw	a4,0(a5)
 264:	0001                	nop
 266:	4472                	lw	s0,28(sp)
 268:	6105                	addi	sp,sp,32
 26a:	8082                	ret

0000026c <start_timer>:
 26c:	1101                	addi	sp,sp,-32
 26e:	ce22                	sw	s0,28(sp)
 270:	1000                	addi	s0,sp,32
 272:	fea42623          	sw	a0,-20(s0)
 276:	feb42423          	sw	a1,-24(s0)
 27a:	200007b7          	lui	a5,0x20000
 27e:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 282:	479c                	lw	a5,8(a5)
 284:	fe842703          	lw	a4,-24(s0)
 288:	c398                	sw	a4,0(a5)
 28a:	200007b7          	lui	a5,0x20000
 28e:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 292:	43dc                	lw	a5,4(a5)
 294:	470d                	li	a4,3
 296:	c398                	sw	a4,0(a5)
 298:	200007b7          	lui	a5,0x20000
 29c:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 2a0:	439c                	lw	a5,0(a5)
 2a2:	4705                	li	a4,1
 2a4:	c398                	sw	a4,0(a5)
 2a6:	200007b7          	lui	a5,0x20000
 2aa:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 2ae:	47dc                	lw	a5,12(a5)
 2b0:	11111737          	lui	a4,0x11111
 2b4:	11170713          	addi	a4,a4,273 # 11111111 <_sidata+0x11110c3d>
 2b8:	c398                	sw	a4,0(a5)
 2ba:	fec42783          	lw	a5,-20(s0)
 2be:	20000737          	lui	a4,0x20000
 2c2:	02870713          	addi	a4,a4,40 # 20000028 <timer>
 2c6:	00072803          	lw	a6,0(a4)
 2ca:	4348                	lw	a0,4(a4)
 2cc:	470c                	lw	a1,8(a4)
 2ce:	4750                	lw	a2,12(a4)
 2d0:	4b14                	lw	a3,16(a4)
 2d2:	4b58                	lw	a4,20(a4)
 2d4:	0107a023          	sw	a6,0(a5)
 2d8:	c3c8                	sw	a0,4(a5)
 2da:	c78c                	sw	a1,8(a5)
 2dc:	c7d0                	sw	a2,12(a5)
 2de:	cb94                	sw	a3,16(a5)
 2e0:	cbd8                	sw	a4,20(a5)
 2e2:	fec42503          	lw	a0,-20(s0)
 2e6:	4472                	lw	s0,28(sp)
 2e8:	6105                	addi	sp,sp,32
 2ea:	8082                	ret

000002ec <delay>:
 2ec:	1101                	addi	sp,sp,-32
 2ee:	ce06                	sw	ra,28(sp)
 2f0:	cc22                	sw	s0,24(sp)
 2f2:	1000                	addi	s0,sp,32
 2f4:	fea42623          	sw	a0,-20(s0)
 2f8:	6785                	lui	a5,0x1
 2fa:	76f78513          	addi	a0,a5,1903 # 176f <_sidata+0x129b>
 2fe:	3f05                	jal	22e <_start_timer>
 300:	200007b7          	lui	a5,0x20000
 304:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 308:	47dc                	lw	a5,12(a5)
 30a:	fec42703          	lw	a4,-20(s0)
 30e:	c398                	sw	a4,0(a5)
 310:	0001                	nop
 312:	200007b7          	lui	a5,0x20000
 316:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 31a:	4b9c                	lw	a5,16(a5)
 31c:	4398                	lw	a4,0(a5)
 31e:	fec42783          	lw	a5,-20(s0)
 322:	fef718e3          	bne	a4,a5,312 <delay+0x26>
 326:	200007b7          	lui	a5,0x20000
 32a:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 32e:	439c                	lw	a5,0(a5)
 330:	0007a023          	sw	zero,0(a5)
 334:	0001                	nop
 336:	40f2                	lw	ra,28(sp)
 338:	4462                	lw	s0,24(sp)
 33a:	6105                	addi	sp,sp,32
 33c:	8082                	ret

0000033e <get_timer_counter>:
 33e:	1141                	addi	sp,sp,-16
 340:	c622                	sw	s0,12(sp)
 342:	0800                	addi	s0,sp,16
 344:	200007b7          	lui	a5,0x20000
 348:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 34c:	4b9c                	lw	a5,16(a5)
 34e:	439c                	lw	a5,0(a5)
 350:	853e                	mv	a0,a5
 352:	4432                	lw	s0,12(sp)
 354:	0141                	addi	sp,sp,16
 356:	8082                	ret

00000358 <end_timer>:
 358:	1141                	addi	sp,sp,-16
 35a:	c622                	sw	s0,12(sp)
 35c:	0800                	addi	s0,sp,16
 35e:	200007b7          	lui	a5,0x20000
 362:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 366:	439c                	lw	a5,0(a5)
 368:	0007a023          	sw	zero,0(a5)
 36c:	200007b7          	lui	a5,0x20000
 370:	02878793          	addi	a5,a5,40 # 20000028 <timer>
 374:	4b9c                	lw	a5,16(a5)
 376:	439c                	lw	a5,0(a5)
 378:	853e                	mv	a0,a5
 37a:	4432                	lw	s0,12(sp)
 37c:	0141                	addi	sp,sp,16
 37e:	8082                	ret

00000380 <uart_init>:
 380:	1101                	addi	sp,sp,-32
 382:	ce22                	sw	s0,28(sp)
 384:	1000                	addi	s0,sp,32
 386:	fea42623          	sw	a0,-20(s0)
 38a:	200007b7          	lui	a5,0x20000
 38e:	01c7a783          	lw	a5,28(a5) # 2000001c <uart_bauddiv>
 392:	fec42703          	lw	a4,-20(s0)
 396:	c398                	sw	a4,0(a5)
 398:	200007b7          	lui	a5,0x20000
 39c:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 3a0:	4705                	li	a4,1
 3a2:	c398                	sw	a4,0(a5)
 3a4:	0001                	nop
 3a6:	4472                	lw	s0,28(sp)
 3a8:	6105                	addi	sp,sp,32
 3aa:	8082                	ret

000003ac <uart_putc>:
 3ac:	1101                	addi	sp,sp,-32
 3ae:	ce22                	sw	s0,28(sp)
 3b0:	1000                	addi	s0,sp,32
 3b2:	87aa                	mv	a5,a0
 3b4:	fef407a3          	sb	a5,-17(s0)
 3b8:	0001                	nop
 3ba:	200007b7          	lui	a5,0x20000
 3be:	0207a783          	lw	a5,32(a5) # 20000020 <uart_status>
 3c2:	439c                	lw	a5,0(a5)
 3c4:	dbfd                	beqz	a5,3ba <uart_putc+0xe>
 3c6:	200007b7          	lui	a5,0x20000
 3ca:	0247a783          	lw	a5,36(a5) # 20000024 <uart_data>
 3ce:	fef44703          	lbu	a4,-17(s0)
 3d2:	c398                	sw	a4,0(a5)
 3d4:	200007b7          	lui	a5,0x20000
 3d8:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 3dc:	4398                	lw	a4,0(a5)
 3de:	200007b7          	lui	a5,0x20000
 3e2:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 3e6:	00276713          	ori	a4,a4,2
 3ea:	c398                	sw	a4,0(a5)
 3ec:	0001                	nop
 3ee:	4472                	lw	s0,28(sp)
 3f0:	6105                	addi	sp,sp,32
 3f2:	8082                	ret

000003f4 <uart_puts>:
 3f4:	7179                	addi	sp,sp,-48
 3f6:	d606                	sw	ra,44(sp)
 3f8:	d422                	sw	s0,40(sp)
 3fa:	1800                	addi	s0,sp,48
 3fc:	fca42e23          	sw	a0,-36(s0)
 400:	fe042623          	sw	zero,-20(s0)
 404:	a839                	j	422 <uart_puts+0x2e>
 406:	fec42783          	lw	a5,-20(s0)
 40a:	fdc42703          	lw	a4,-36(s0)
 40e:	97ba                	add	a5,a5,a4
 410:	0007c783          	lbu	a5,0(a5)
 414:	853e                	mv	a0,a5
 416:	3f59                	jal	3ac <uart_putc>
 418:	fec42783          	lw	a5,-20(s0)
 41c:	0785                	addi	a5,a5,1
 41e:	fef42623          	sw	a5,-20(s0)
 422:	fec42783          	lw	a5,-20(s0)
 426:	fdc42703          	lw	a4,-36(s0)
 42a:	97ba                	add	a5,a5,a4
 42c:	0007c783          	lbu	a5,0(a5)
 430:	fbf9                	bnez	a5,406 <uart_puts+0x12>
 432:	0001                	nop
 434:	0001                	nop
 436:	50b2                	lw	ra,44(sp)
 438:	5422                	lw	s0,40(sp)
 43a:	6145                	addi	sp,sp,48
 43c:	8082                	ret

0000043e <uart_puti8>:
 43e:	1101                	addi	sp,sp,-32
 440:	ce22                	sw	s0,28(sp)
 442:	1000                	addi	s0,sp,32
 444:	87aa                	mv	a5,a0
 446:	fef407a3          	sb	a5,-17(s0)
 44a:	0001                	nop
 44c:	200007b7          	lui	a5,0x20000
 450:	0207a783          	lw	a5,32(a5) # 20000020 <uart_status>
 454:	439c                	lw	a5,0(a5)
 456:	dbfd                	beqz	a5,44c <uart_puti8+0xe>
 458:	200007b7          	lui	a5,0x20000
 45c:	0247a783          	lw	a5,36(a5) # 20000024 <uart_data>
 460:	fef44703          	lbu	a4,-17(s0)
 464:	c398                	sw	a4,0(a5)
 466:	200007b7          	lui	a5,0x20000
 46a:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 46e:	4398                	lw	a4,0(a5)
 470:	200007b7          	lui	a5,0x20000
 474:	0187a783          	lw	a5,24(a5) # 20000018 <uart_ctrl>
 478:	00276713          	ori	a4,a4,2
 47c:	c398                	sw	a4,0(a5)
 47e:	0001                	nop
 480:	4472                	lw	s0,28(sp)
 482:	6105                	addi	sp,sp,32
 484:	8082                	ret

00000486 <uart_puti>:
 486:	7179                	addi	sp,sp,-48
 488:	d606                	sw	ra,44(sp)
 48a:	d422                	sw	s0,40(sp)
 48c:	1800                	addi	s0,sp,48
 48e:	fca42e23          	sw	a0,-36(s0)
 492:	fe042623          	sw	zero,-20(s0)
 496:	a01d                	j	4bc <uart_puti+0x36>
 498:	fec42783          	lw	a5,-20(s0)
 49c:	078e                	slli	a5,a5,0x3
 49e:	fdc42703          	lw	a4,-36(s0)
 4a2:	40f757b3          	sra	a5,a4,a5
 4a6:	fef405a3          	sb	a5,-21(s0)
 4aa:	feb44783          	lbu	a5,-21(s0)
 4ae:	853e                	mv	a0,a5
 4b0:	3779                	jal	43e <uart_puti8>
 4b2:	fec42783          	lw	a5,-20(s0)
 4b6:	0785                	addi	a5,a5,1
 4b8:	fef42623          	sw	a5,-20(s0)
 4bc:	fec42703          	lw	a4,-20(s0)
 4c0:	478d                	li	a5,3
 4c2:	fce7dbe3          	bge	a5,a4,498 <uart_puti+0x12>
 4c6:	0001                	nop
 4c8:	0001                	nop
 4ca:	50b2                	lw	ra,44(sp)
 4cc:	5422                	lw	s0,40(sp)
 4ce:	6145                	addi	sp,sp,48
 4d0:	8082                	ret
	...

Disassembly of section .data:

20000000 <gpio_data_2>:
20000000:	0000                	unimp
20000002:	4200                	lw	s0,0(a2)

20000004 <gpio_oe_2>:
20000004:	0004                	.insn	2, 0x0004
20000006:	4200                	lw	s0,0(a2)

20000008 <i2s_en>:
20000008:	0000                	unimp
2000000a:	8000                	.insn	2, 0x8000

2000000c <i2s_data>:
2000000c:	0008                	.insn	2, 0x0008
2000000e:	8000                	.insn	2, 0x8000

20000010 <i2s_done>:
20000010:	0004                	.insn	2, 0x0004
20000012:	8000                	.insn	2, 0x8000

20000014 <i2s_status>:
20000014:	000c                	.insn	2, 0x000c
20000016:	8000                	.insn	2, 0x8000

20000018 <uart_ctrl>:
20000018:	0000                	unimp
2000001a:	5000                	lw	s0,32(s0)

2000001c <uart_bauddiv>:
2000001c:	0004                	.insn	2, 0x0004
2000001e:	5000                	lw	s0,32(s0)

20000020 <uart_status>:
20000020:	0008                	.insn	2, 0x0008
20000022:	5000                	lw	s0,32(s0)

20000024 <uart_data>:
20000024:	000c                	.insn	2, 0x000c
20000026:	5000                	lw	s0,32(s0)

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
